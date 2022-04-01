Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3951AC3527D
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 13:23:42 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web08.10614.1648819420813094616
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Apr 2022 06:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=aYvwQLvt;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 0101017fe54bb985-53c8a899-afbe-47e3-983c-0704dc7acdbc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1648819419;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=HpjjEVozNPjgblKRSPC1uW2VTpmfb+xk+HYVM2ltmzE=;
	b=aYvwQLvt2IMorwiQm6e8gbzSsYTAVBvdU0Swrp5ZA5bHpVPUOp9Hgsb6d96yFByY
	/UjbwjyaRdzMm08FEtt0XuDk+G4G1Twt+xjn2m7v6O0Yy66ulZW8eXF+LhbAP01rokg
	wcC19VTUlT8ai9Y5DPT5UCa0FojFHmAHCe68XL6U=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1648819419;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=HpjjEVozNPjgblKRSPC1uW2VTpmfb+xk+HYVM2ltmzE=;
	b=iYOkAbLFgKDRS0ObKEuOm9z6KoWb3RrEBfhFCIbZle0J3X50vTAirWGjruab8uZO
	WG8CaO6o5CQmVzwRYnxrfOPrP5J5yPGVYM+EiquVnF2TOodwdmw+YmqjDoVsJNFMfIA
	7T1ACiOdZDh8DuAri3qzPPOW3Ois6COnZbAwR0ls=
Content-Type: multipart/mixed; boundary="===============8990413631242575061=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] createrepo-c: upgrading to 0.20.0 SUCCEEDED
Message-ID: 
 <0101017fe54bb985-53c8a899-afbe-47e3-983c-0704dc7acdbc-000000@us-west-2.amazonses.com>
Date: Fri, 1 Apr 2022 13:23:39 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Apr 2022 13:23:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163907

--===============8990413631242575061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *createrepo-c* to *0.20.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-createrepo-c-upgrade-0.19.0-0.20.0.patch
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
--===============8990413631242575061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.0.19.0", added "/usr/lib/libcreaterepo_c.so.0.20.0"
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.19.0 to libcreaterepo_c.so.0.20.0
  /usr/lib/libcreaterepo_c.so.0.19.0 moved to /usr/lib/libcreaterepo_c.so.0.20.0

--===============8990413631242575061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1642 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (881 cached, 1 parsed). 1640 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:44f5a91682072a6cd17c8d45f1ff4bbb850996fe"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 224 Local 18 Mirrors 0 Missed 206 Current 297 (8% match, 60% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 338 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 360 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.02.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 365 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.25.bb:do_packagedata_setscene)
NOTE: Running setscene task 437 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 521 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 514 of 521 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-jinja2_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 515 of 521 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 516 of 521 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libxslt/libxslt_1.1.35.bb:do_populate_sysroot_setscene)
NOTE: Running task 370 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 374 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_fetch)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: Running task 478 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_fetch)
NOTE: recipe tzdata-2021e-r0: task do_packagedata_setscene: Started
NOTE: recipe autoconf-archive-2022.02.11-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: Running task 500 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_fetch)
NOTE: recipe wayland-protocols-1.25-r0: task do_packagedata_setscene: Started
NOTE: Running task 501 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_fetch)
NOTE: Running task 502 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_fetch)
NOTE: Running task 503 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_fetch)
NOTE: Running task 504 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 505 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_fetch)
NOTE: recipe python3-jinja2-native-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxslt-native-1.1.35-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-native-1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-native-1.46.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 723 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_fetch)
NOTE: recipe libtirpc-1.3.2-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 766 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_fetch)
NOTE: recipe libffi-3.4.2-r0: task do_fetch: Started
NOTE: Running task 777 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: recipe sqlite3-3_3.38.2-r0: task do_fetch: Started
NOTE: Running task 788 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_unpack)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-protocols-1.25-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: Running task 789 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_fetch: Started
NOTE: recipe autoconf-archive-2022.02.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 791 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_unpack)
NOTE: Running task 792 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.38.2-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 793 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 794 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe tzdata-2021e-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 795 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_unpack)
NOTE: Running task 796 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_unpack)
NOTE: Running task 797 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_unpack)
NOTE: Running task 798 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_unpack)
NOTE: Running task 799 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 800 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: Running task 801 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 802 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 803 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.10.3-r0: task do_fetch: Started
NOTE: Running task 855 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_fetch)
NOTE: Running task 872 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_fetch)
NOTE: Running task 883 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_fetch)
NOTE: recipe expat-2.4.7-r0: task do_fetch: Started
NOTE: Running task 885 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_fetch)
NOTE: Running task 886 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_fetch)
NOTE: Running task 887 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_fetch)
NOTE: Running task 888 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 896 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 905 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_write_config)
NOTE: Running task 906 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_fetch)
NOTE: recipe openssl-3.0.2-r0: task do_unpack: Started
NOTE: Running task 913 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: Running task 914 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_write_config)
NOTE: Running task 917 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_write_config)
NOTE: Running task 921 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_fetch)
NOTE: Running task 922 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: Running task 923 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_fetch)
NOTE: Running task 924 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_fetch)
NOTE: Running task 925 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_fetch)
NOTE: Running task 926 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_fetch)
NOTE: Running task 927 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_fetch)
NOTE: Running task 935 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe python3-jinja2-native-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxslt-native-1.1.35-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Started
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 963 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_fetch)
NOTE: Running task 964 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_fetch)
NOTE: Running task 965 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_fetch)
NOTE: Running task 966 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_fetch)
NOTE: Running task 968 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_fetch)
NOTE: Running task 969 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_fetch)
NOTE: Running task 970 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_fetch)
NOTE: Running task 971 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_fetch)
NOTE: Running task 974 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 975 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_fetch)
NOTE: Running task 976 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_fetch)
NOTE: Running task 977 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_fetch)
NOTE: Running setscene task 520 of 521 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-markupsafe_2.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-native-1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 521 of 521 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.10.3-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.5-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_unpack: Started
NOTE: Running task 985 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_fetch)
NOTE: recipe readline-8.1.2-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: Running task 986 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_unpack)
NOTE: Running task 987 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_unpack)
NOTE: Running task 988 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.2-r0: task do_unpack: Started
NOTE: recipe xz-5.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2021.5-r0: task do_fetch: Started
NOTE: recipe xz-5.2.5-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_fetch: Succeeded
NOTE: Running task 989 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_unpack)
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_write_config: Started
NOTE: Running task 990 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_patch)
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: Running task 991 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_patch)
NOTE: Running task 992 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 993 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_unpack)
NOTE: Running task 994 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_unpack)
NOTE: recipe wayland-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.20.0-r0: task do_write_config: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Started
NOTE: recipe libxcb-1.14-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: Running task 995 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_unpack)
NOTE: recipe readline-8.1.2-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_write_config: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe curl-7.82.0-r0: task do_fetch: Started
NOTE: Running task 996 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_patch)
NOTE: Running task 997 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_unpack)
NOTE: Running task 998 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_unpack)
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 999 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_unpack)
NOTE: Running task 1000 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.9.4-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: recipe file-5.41-r0: task do_fetch: Started
NOTE: Running task 1001 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_fetch: Started
NOTE: recipe curl-7.82.0-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_fetch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Started
NOTE: Running task 1002 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_patch)
NOTE: recipe gnutls-3.7.4-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: Running task 1003 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: Running task 1004 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 1005 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2021.5-r0: task do_write_config: Succeeded
NOTE: recipe kmod-29-r0: task do_fetch: Started
NOTE: Running task 1006 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.44-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.9.4-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_fetch: Started
NOTE: Running task 1007 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: Running task 1008 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnutls-3.7.4-r0: task do_fetch: Succeeded
NOTE: recipe file-5.41-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1009 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_fetch: Succeeded
NOTE: recipe kmod-29-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_write_config: Succeeded
NOTE: Running task 1010 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_unpack)
NOTE: Running task 1011 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: Running task 1012 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe e2fsprogs-native-1.46.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_unpack: Started
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Started
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: recipe expat-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.2-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_unpack: Started
NOTE: Running task 1014 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe python3-markupsafe-native-2.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Started
NOTE: recipe xorgproto-2021.5-r0: task do_unpack: Started
NOTE: recipe libxml2-native-2.9.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.7.3-r0: task do_unpack: Started
NOTE: Running task 1051 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_unpack)
NOTE: Running task 1052 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: Running task 1053 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_unpack)
NOTE: Running task 1054 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_unpack)
NOTE: Running task 1055 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_unpack)
NOTE: Running task 1056 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_unpack)
NOTE: Running task 1057 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_unpack)
NOTE: Running task 1058 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: Running task 1061 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_fetch)
NOTE: Running task 1062 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1063 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_fetch)
NOTE: Running task 1064 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_unpack)
NOTE: Running task 1065 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_unpack)
NOTE: Running task 1067 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_unpack)
NOTE: Running task 1068 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_250.4-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Succeeded
NOTE: Running task 1069 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_patch)
NOTE: Running task 1070 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.10.3-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_patch: Started
NOTE: recipe wayland-1.20.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_unpack: Started
NOTE: Running task 1071 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe readline-8.1.2-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe systemd-1_250.4-r0: task do_fetch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: recipe nettle-3.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2021.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1074 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_unpack)
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1078 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_unpack)
NOTE: recipe libtirpc-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: Running task 1079 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_unpack)
NOTE: Running task 1080 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_unpack)
NOTE: recipe expat-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe nettle-3.7.3-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: Running task 1081 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1082 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: Running task 1083 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_patch)
NOTE: recipe libxcb-1.14-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: Running task 1084 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_patch)
NOTE: recipe libffi-3.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_unpack: Started
NOTE: Running task 1085 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_patch)
NOTE: Running task 1086 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: Running task 1087 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_unpack)
NOTE: recipe python3-markupsafe-native-2.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe file-5.41-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.44-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1088 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Started
NOTE: recipe dbus-1.14.0-r0: task do_fetch: Started
NOTE: recipe xz-5.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1089 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_patch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_unpack: Started
NOTE: Running task 1116 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_fetch: Succeeded
NOTE: Running task 1124 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: Running task 1135 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 1136 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_unpack)
NOTE: Running task 1137 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_unpack)
NOTE: Running task 1138 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_unpack)
NOTE: Running task 1139 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_unpack)
NOTE: recipe libxml2-native-2.9.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.7.4-r0: task do_unpack: Started
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Started
NOTE: Setscene tasks completed
NOTE: Running task 1140 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1152 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_deploy_source_date_epoch)
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: Running task 1165 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_patch)
NOTE: Running task 1172 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot)
NOTE: recipe expat-2.4.7-r0: task do_patch: Started
NOTE: recipe nettle-3.7.3-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_patch: Started
NOTE: Running task 1173 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_patch)
NOTE: Running task 1174 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_patch)
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1175 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_patch)
NOTE: recipe openssl-3.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1176 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_patch)
NOTE: Running task 1177 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_patch)
NOTE: recipe kmod-29-r0: task do_unpack: Started
NOTE: Running task 1178 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: Running task 1188 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.14-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1189 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_patch)
NOTE: Running task 1196 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libffi-3.4.2-r0: task do_patch: Succeeded
NOTE: Running task 1197 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_patch)
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: recipe file-5.41-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Started
NOTE: Running task 1198 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1199 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_patch)
NOTE: recipe readline-8.1.2-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: Running task 1200 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_patch)
NOTE: recipe libarchive-3.6.0-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_unpack: Started
NOTE: Running task 1201 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: Running task 1202 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_patch)
NOTE: recipe sqlite3-3_3.38.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1203 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_patch: Started
NOTE: recipe expat-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2021.5-r0: task do_patch: Started
NOTE: recipe systemd-1_250.4-r0: task do_unpack: Started
NOTE: Running task 1204 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe libseccomp-2.5.3-r0: task do_patch: Succeeded
NOTE: Running task 1205 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot)
NOTE: recipe expat-2.4.7-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_patch: Started
NOTE: Running task 1206 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_generate_toolchain_file)
NOTE: recipe libgpg-error-1.44-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: Running task 1207 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1208 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1209 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_patch)
NOTE: Running task 1211 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot)
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_patch: Started
NOTE: Running task 1212 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_patch)
NOTE: Running task 1213 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_patch)
NOTE: recipe libxcb-1.14-r0: task do_patch: Started
NOTE: Running task 1214 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_patch)
NOTE: Running task 1215 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Started
NOTE: recipe zstd-1.5.2-r0: task do_patch: Started
NOTE: Running task 1216 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_patch: Started
NOTE: Running task 1218 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_unpack)
NOTE: Running task 1219 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_patch)
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1220 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_configure)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre-8.45-r0: task do_patch: Started
NOTE: Running task 1221 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1222 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_unpack)
NOTE: Running task 1225 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1226 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_patch: Succeeded
NOTE: Running task 1227 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Started
NOTE: Running task 1228 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1229 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1236 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_write_config)
NOTE: Running task 1237 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_patch)
NOTE: recipe libarchive-3.6.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_generate_toolchain_file: Started
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: Running task 1238 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.44-r0: task do_patch: Started
NOTE: Running task 1239 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_patch)
NOTE: Running task 1247 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_write_config)
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 1248 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_configure)
NOTE: recipe file-5.41-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: Running task 1249 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1250 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1251 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_deploy_source_date_epoch)
NOTE: Running task 1252 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe sqlite3-3_3.38.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_unpack: Started
NOTE: recipe libxcb-1.14-r0: task do_patch: Succeeded
NOTE: recipe kmod-29-r0: task do_patch: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_configure: Started
NOTE: recipe libpcre-8.45-r0: task do_patch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: Running task 1253 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_configure)
NOTE: recipe expat-2.4.7-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1254 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_patch: Succeeded
NOTE: Running task 1255 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1256 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1257 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1258 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: Running task 1259 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1260 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1261 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1287 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_warn_musl)
NOTE: Running task 1288 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_write_config)
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_write_config: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1289 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_patch)
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1300 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: recipe libarchive-3.6.0-r0: task do_patch: Started
NOTE: recipe curl-7.82.0-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_write_config: Started
NOTE: Running task 1301 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch)
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_configure: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1302 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_configure)
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1303 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1304 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_patch)
NOTE: Running task 1305 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: Running task 1306 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: Running task 1307 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_configure: Started
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_write_config: Succeeded
NOTE: recipe libgcrypt-1.9.4-r0: task do_unpack: Succeeded
NOTE: Running task 1308 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_configure)
NOTE: recipe curl-7.82.0-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1309 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_configure)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe wayland-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1310 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_patch)
NOTE: recipe nettle-3.7.3-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.0-r0: task do_patch: Succeeded
NOTE: Running task 1311 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_patch)
NOTE: Running task 1312 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1318 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 1327 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_fetch)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1328 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1329 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_configure)
NOTE: recipe openssl-3.0.2-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe kmod-29-r0: task do_patch: Succeeded
NOTE: Running task 1330 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1331 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1332 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_configure)
NOTE: Running task 1333 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1334 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_configure)
NOTE: recipe libffi-3.4.2-r0: task do_configure: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe systemd-1_250.4-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_250.4-r0: task do_write_config: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1335 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-1_250.4-r0: task do_warn_musl: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.44-r0: task do_patch: Succeeded
NOTE: Running task 1336 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1337 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_configure)
NOTE: recipe readline-8.1.2-r0: task do_configure: Started
NOTE: Running task 1338 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_deploy_source_date_epoch)
NOTE: Running task 1345 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe dbus-1.14.0-r0: task do_unpack: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: recipe curl-7.82.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1351 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_patch)
NOTE: recipe libxml2-2.9.13-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1386 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe expat-2.4.7-r0: task do_configure: Started
NOTE: recipe systemd-1_250.4-r0: task do_write_config: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_fetch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Succeeded
NOTE: Running task 1424 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_unpack)
NOTE: recipe libseccomp-2.5.3-r0: task do_configure: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_patch: Succeeded
NOTE: Running task 1458 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1466 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1467 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_configure)
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: Running task 1468 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_compile)
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: recipe xorgproto-2021.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_configure: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1469 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1470 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: Running task 1471 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe libgpg-error-1.44-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gnutls-3.7.4-r0: task do_unpack: Succeeded
NOTE: Running task 1472 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: recipe dbus-1.14.0-r0: task do_patch: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1473 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_configure)
NOTE: recipe createrepo-c-0.20.0-r0: task do_unpack: Started
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1474 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1475 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.2-r0: task do_configure: Succeeded
NOTE: Running task 1476 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 1477 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1478 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_compile)
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_patch: Succeeded
NOTE: Running task 1479 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_configure)
NOTE: recipe systemd-1_250.4-r0: task do_unpack: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_unpack: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1480 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_configure)
NOTE: recipe libgcrypt-1.9.4-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_patch: Succeeded
NOTE: Running task 1481 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1482 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1483 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_patch)
NOTE: recipe elfutils-0.186-r0: task do_unpack: Succeeded
NOTE: Running task 1484 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_patch)
NOTE: Running task 1485 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_configure)
NOTE: Running task 1486 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1487 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_configure)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: Running task 1488 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1489 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_patch)
NOTE: recipe python3-3.10.3-r0: task do_unpack: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Started
NOTE: Running task 1490 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_patch)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_configure: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe gnutls-3.7.4-r0: task do_patch: Started
NOTE: recipe zstd-1.5.2-r0: task do_compile: Started
NOTE: Running task 1491 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 1492 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.7.3-r0: task do_configure: Started
NOTE: recipe openssl-3.0.2-r0: task do_configure: Started
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.186-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.44-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_patch: Started
NOTE: recipe kmod-29-r0: task do_configure: Started
NOTE: recipe dbus-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-1_250.4-r0: task do_patch: Started
NOTE: recipe gnutls-3.7.4-r0: task do_patch: Succeeded
NOTE: Running task 1493 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.10.3-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe gnutls-3.7.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1494 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1495 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: recipe dbus-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1496 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot)
NOTE: recipe createrepo-c-0.20.0-r0: task do_patch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Started
NOTE: Running task 1497 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1498 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_generate_toolchain_file)
NOTE: Running task 1499 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_populate_lic)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: Running task 1500 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe createrepo-c-0.20.0-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe gnutls-3.7.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_populate_lic unihash changed to 47b2b04b562dfc64a7348e486d04f0c60a53c5f0410422a36585aa109212c49f
NOTE: recipe createrepo-c-0.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_patch: Succeeded
NOTE: Running task 1501 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_250.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 1502 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_configure_ptest_base)
NOTE: recipe xorgproto-2021.5-r0: task do_configure: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1503 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_compile)
NOTE: recipe expat-2.4.7-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.186-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_compile: Started
NOTE: Running task 1504 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.4.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1505 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_compile)
NOTE: recipe xorgproto-2021.5-r0: task do_compile: Succeeded
NOTE: Running task 1506 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_install)
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.7-r0: task do_compile: Started
NOTE: recipe xorgproto-2021.5-r0: task do_install: Started
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 1507 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Succeeded
NOTE: recipe python3-3.10.3-r0: task do_patch: Succeeded
NOTE: Running task 1508 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1509 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1510 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_compile)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Succeeded
NOTE: Running task 1511 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_install)
NOTE: recipe python3-3.10.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1512 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_install: Succeeded
NOTE: Running task 1513 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot)
NOTE: Running task 1514 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_package)
NOTE: recipe python3-3.10.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot: Started
NOTE: Running task 1515 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_compile)
NOTE: recipe xorgproto-2021.5-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1516 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Succeeded
NOTE: Running task 1517 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot)
NOTE: Running task 1518 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package)
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Succeeded
NOTE: Running task 1519 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_install)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Succeeded
NOTE: Running task 1520 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1521 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_compile)
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1522 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1523 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1524 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1525 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_install)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1526 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1527 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1528 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_configure)
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1529 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot)
NOTE: Running task 1530 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot)
NOTE: Running task 1531 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_configure)
NOTE: Running task 1532 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: Running task 1533 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package)
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_package: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Succeeded
NOTE: Running task 1534 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata)
NOTE: Running task 1535 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe nettle-3.7.3-r0: task do_configure: Succeeded
NOTE: Running task 1536 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_configure_ptest_base)
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.7.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1537 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_compile)
NOTE: recipe nettle-3.7.3-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1538 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Succeeded
NOTE: Running task 1539 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1540 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Succeeded
NOTE: Running task 1541 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: Running task 1542 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 1543 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_compile_ptest_base)
NOTE: recipe expat-2.4.7-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.4.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1544 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_install)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Succeeded
NOTE: Running task 1545 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_install)
NOTE: recipe expat-2.4.7-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_configure: Succeeded
NOTE: Running task 1546 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_compile)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Started
NOTE: recipe expat-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 1547 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_install_ptest_base)
NOTE: recipe sqlite3-3_3.38.2-r0: task do_compile: Started
NOTE: recipe expat-2.4.7-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.4.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1548 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 1549 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_package)
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.4.7-r0: task do_package: Started
NOTE: recipe readline-8.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1550 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_compile)
NOTE: recipe readline-8.1.2-r0: task do_compile: Started
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1551 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Succeeded
NOTE: Running task 1552 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot)
NOTE: Running task 1553 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Started
NOTE: Running task 1554 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1555 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_compile)
NOTE: recipe libtirpc-1.3.2-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1556 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe readline-8.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1557 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1558 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: Running task 1559 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe readline-8.1.2-r0: task do_install: Started
NOTE: recipe expat-2.4.7-r0: task do_package: Succeeded
NOTE: Running task 1560 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe expat-2.4.7-r0: task do_packagedata: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1561 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.4.7-r0: task do_packagedata: Failed
NOTE: recipe libtirpc-1.3.2-r0: task do_compile: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.1.2-r0: task do_install: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_configure: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_configure: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: recipe kmod-29-r0: task do_configure: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_configure: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_configure: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_compile: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_configure: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_compile: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1561 tasks of which 1243 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/expat/2.4.7-r0/temp/log.do_packagedata.2134181
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata) failed with exit code '1'

--===============8990413631242575061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-bash-completion: PV changed from "0.19.0" to "0.20.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: FILELIST: removed "/usr/lib/.debug/libcreaterepo_c.so.0.19.0", added "/usr/lib/.debug/libcreaterepo_c.so.0.20.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PV changed from "0.19.0" to "0.20.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dbg: PKGSIZE changed from 1143720 to 1148796 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PV changed from "0.19.0" to "0.20.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-dev: PKGSIZE changed from 139947 to 138270 (-1%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-doc: PV changed from "0.19.0" to "0.20.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-locale: PV changed from "0.19.0" to "0.20.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PV changed from "0.19.0" to "0.20.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c-src: PKGSIZE changed from 1214231 to 1219452 (+0%)
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c-staticdev: PV changed from "0.19.0" to "0.20.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: FILELIST: removed "/usr/lib/libcreaterepo_c.so.0.19.0", added "/usr/lib/libcreaterepo_c.so.0.20.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PV changed from "0.19.0" to "0.20.0"
packages/core2-32-poky-linux/createrepo-c/createrepo-c: PKGSIZE changed from 525633 to 530311 (+1%)
packages/core2-32-poky-linux/createrepo-c: PKGV changed from 0.19.0 [default] to 0.20.0 [default]
packages/core2-32-poky-linux/createrepo-c: PV changed from "0.19.0" to "0.20.0"
Changes to packages/core2-32-poky-linux/createrepo-c (sysroot):
  /usr/lib/libcreaterepo_c.so.0 changed symlink target from libcreaterepo_c.so.0.19.0 to libcreaterepo_c.so.0.20.0
  /usr/lib/libcreaterepo_c.so.0.19.0 moved to /usr/lib/libcreaterepo_c.so.0.20.0

--===============8990413631242575061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 69 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:44f5a91682072a6cd17c8d45f1ff4bbb850996fe"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 218 Local 12 Mirrors 0 Missed 206 Current 303 (5% match, 60% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 344 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.02.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.25.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running task 370 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 374 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_fetch)
NOTE: Running task 478 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_fetch)
NOTE: Running task 501 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_fetch)
NOTE: Running task 502 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_fetch)
NOTE: Running task 503 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_fetch)
NOTE: Running task 504 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_fetch)
NOTE: Running task 505 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 506 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_fetch)
NOTE: recipe autoconf-archive-2022.02.11-r0: task do_packagedata_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2021e-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.25-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.2-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.2-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_fetch: Started
NOTE: Running task 739 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_fetch)
NOTE: Running task 749 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: Running task 750 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.4.2-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_fetch: Started
NOTE: recipe readline-8.1.2-r0: task do_fetch: Started
NOTE: Running task 767 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: Running task 768 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 781 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_unpack)
NOTE: recipe xz-5.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 782 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.38.2-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe wayland-protocols-1.25-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe autoconf-archive-2022.02.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 797 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_unpack)
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 798 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_unpack)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 799 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_unpack)
NOTE: Running task 800 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 801 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_unpack)
NOTE: Running task 802 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: Running task 803 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 804 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe tzdata-2021e-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 805 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Setscene tasks completed
NOTE: recipe python3-3.10.3-r0: task do_fetch: Started
NOTE: Running task 813 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_fetch)
NOTE: Running task 824 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: recipe expat-2.4.7-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.2-r0: task do_unpack: Started
NOTE: Running task 903 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_fetch)
NOTE: recipe expat-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running task 926 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_fetch)
NOTE: Running task 937 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_fetch)
NOTE: recipe python3-3.10.3-r0: task do_fetch: Succeeded
NOTE: Running task 940 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_fetch)
NOTE: Running task 941 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_fetch)
NOTE: Running task 942 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_fetch)
NOTE: Running task 943 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 959 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 968 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_write_config)
NOTE: Running task 969 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_fetch)
NOTE: Running task 984 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot)
NOTE: recipe libtirpc-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.5-r0: task do_unpack: Started
NOTE: Running task 985 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_unpack)
NOTE: Running task 986 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_unpack)
NOTE: Running task 987 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.4.2-r0: task do_unpack: Started
NOTE: recipe readline-8.1.2-r0: task do_unpack: Started
NOTE: Running task 988 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: Running task 989 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_write_config)
NOTE: Running task 992 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_write_config)
NOTE: Running task 996 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_fetch)
NOTE: Running task 997 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_fetch)
NOTE: Running task 998 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_fetch)
NOTE: Running task 999 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: recipe libffi-3.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1000 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_fetch)
NOTE: Running task 1001 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_fetch)
NOTE: Running task 1002 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_fetch)
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: Running task 1010 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe xz-5.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1038 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_fetch)
NOTE: Running task 1039 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_fetch)
NOTE: Running task 1040 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_fetch)
NOTE: Running task 1044 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_fetch)
NOTE: Running task 1046 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_fetch)
NOTE: Running task 1047 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_fetch)
NOTE: Running task 1048 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_fetch)
NOTE: Running task 1049 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_fetch)
NOTE: Running task 1054 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1055 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_fetch)
NOTE: Running task 1056 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_fetch)
NOTE: Running task 1057 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_fetch)
NOTE: Running task 1058 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_fetch)
NOTE: Running task 1059 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: recipe sqlite3-3_3.38.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Started
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 1060 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_patch)
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_fetch: Started
NOTE: Running task 1061 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_unpack)
NOTE: recipe libseccomp-2.5.3-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_fetch: Started
NOTE: recipe nettle-3.7.3-r0: task do_fetch: Started
NOTE: recipe nettle-3.7.3-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_fetch: Started
NOTE: Running task 1062 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_unpack)
NOTE: recipe wayland-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_write_config: Started
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Started
NOTE: Running task 1063 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_patch)
NOTE: recipe libtirpc-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Started
NOTE: Running task 1064 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_patch)
NOTE: recipe readline-8.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1065 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_patch)
NOTE: recipe expat-2.4.7-r0: task do_unpack: Started
NOTE: Running task 1066 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: Running task 1067 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_unpack)
NOTE: Running task 1068 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_unpack)
NOTE: Running task 1069 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_unpack)
NOTE: Running task 1070 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: Running task 1071 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Started
NOTE: Running task 1072 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Started
NOTE: recipe expat-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_write_config: Started
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot: Started
NOTE: Running task 1073 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_unpack)
NOTE: Running task 1074 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_unpack)
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Started
NOTE: Running task 1075 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 1076 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: recipe libxcb-1.14-r0: task do_fetch: Started
NOTE: recipe libxcb-1.14-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_fetch: Started
NOTE: Running task 1077 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_fetch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_write_config: Succeeded
NOTE: Running task 1078 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: Running task 1079 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_write_config: Started
NOTE: recipe curl-7.82.0-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.44-r0: task do_fetch: Succeeded
NOTE: recipe file-5.41-r0: task do_fetch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Started
NOTE: Running task 1080 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 1081 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.9.4-r0: task do_fetch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.7.4-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.4-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: Running task 1082 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_unpack)
NOTE: Running task 1083 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: Running task 1084 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe curl-7.82.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.10.3-r0: task do_unpack: Started
NOTE: recipe file-5.41-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 1085 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_unpack)
NOTE: Running task 1086 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_unpack)
NOTE: Running task 1087 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_unpack)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_fetch: Started
NOTE: Running task 1088 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_patch: Started
NOTE: Running task 1089 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_unpack)
NOTE: recipe kmod-29-r0: task do_fetch: Started
NOTE: Running task 1090 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: Running task 1091 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_unpack)
NOTE: Running task 1092 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: Running task 1093 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_fetch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1094 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_fetch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Started
NOTE: Running task 1095 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_unpack)
NOTE: recipe wayland-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe kmod-29-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_patch: Started
NOTE: Running task 1096 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_unpack)
NOTE: recipe libffi-3.4.2-r0: task do_patch: Started
NOTE: recipe expat-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_write_config: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_patch: Started
NOTE: Running task 1102 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_unpack)
NOTE: Running task 1104 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libseccomp-2.5.3-r0: task do_unpack: Started
NOTE: Running task 1105 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_patch)
NOTE: Running task 1106 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1107 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-1_250.4-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: recipe nettle-3.7.3-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_unpack: Started
NOTE: Running task 1108 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_unpack: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.1.2-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe nettle-3.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1111 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: Running task 1115 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_unpack)
NOTE: Running task 1116 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_unpack)
NOTE: Running task 1117 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_unpack)
NOTE: Running task 1118 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_unpack)
NOTE: recipe xorgproto-2021.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1165 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Started
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: Running task 1166 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Started
NOTE: Running task 1167 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 1168 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_unpack)
NOTE: Running task 1169 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_unpack)
NOTE: recipe xz-5.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_patch: Succeeded
NOTE: Running task 1170 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_unpack)
NOTE: recipe libxcb-1.14-r0: task do_unpack: Started
NOTE: recipe curl-7.82.0-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Succeeded
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 1171 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_unpack: Started
NOTE: recipe elfutils-0.186-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.44-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_unpack: Started
NOTE: Running task 1172 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_unpack)
NOTE: Running task 1173 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe dbus-1.14.0-r0: task do_fetch: Started
NOTE: Running task 1174 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Started
NOTE: Running task 1175 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: recipe nettle-3.7.3-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe elfutils-0.186-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_fetch: Succeeded
NOTE: Running task 1176 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 1177 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_patch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_unpack: Started
NOTE: Running task 1178 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 1179 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe libseccomp-2.5.3-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_unpack: Started
NOTE: Running task 1180 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: Running task 1187 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot)
NOTE: recipe gnutls-3.7.4-r0: task do_unpack: Started
NOTE: Running task 1188 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_patch)
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe wayland-1.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 1189 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_patch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1190 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe kmod-29-r0: task do_unpack: Started
NOTE: Running task 1191 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_patch)
NOTE: recipe libarchive-3.6.0-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Started
NOTE: Running task 1192 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_patch)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_unpack: Started
NOTE: Running task 1193 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libffi-3.4.2-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1194 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe expat-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1195 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: Running task 1196 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.7-r0: task do_patch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1197 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libxcb-1.14-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2021.5-r0: task do_unpack: Succeeded
NOTE: Running task 1198 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_generate_toolchain_file)
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: recipe nettle-3.7.3-r0: task do_patch: Started
NOTE: recipe systemd-1_250.4-r0: task do_unpack: Started
NOTE: Running task 1199 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_unpack: Succeeded
NOTE: Running task 1200 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Started
NOTE: Running task 1201 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_patch)
NOTE: Running task 1202 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_patch)
NOTE: Running task 1203 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_patch)
NOTE: Running task 1204 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_patch)
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1205 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe wayland-1.20.0-r0: task do_patch: Started
NOTE: recipe openssl-3.0.2-r0: task do_patch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_patch: Started
NOTE: recipe readline-8.1.2-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1206 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1207 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_patch)
NOTE: Running task 1208 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_patch)
NOTE: Running task 1209 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_patch)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Started
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1210 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_patch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_unpack: Succeeded
NOTE: Running task 1211 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1212 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_patch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_generate_toolchain_file: Started
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe nettle-3.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1213 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot)
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_patch: Started
NOTE: recipe zstd-1.5.2-r0: task do_patch: Started
NOTE: recipe libxcb-1.14-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmod-29-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1214 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libarchive-3.6.0-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Started
NOTE: recipe file-5.41-r0: task do_patch: Started
NOTE: Running task 1215 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_configure)
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1216 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1217 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1218 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_patch)
NOTE: Running task 1221 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: Running task 1222 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_unpack)
NOTE: Running task 1223 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_unpack)
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1224 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_patch)
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.7-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1225 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_configure)
NOTE: recipe libgpg-error-1.44-r0: task do_patch: Started
NOTE: recipe zstd-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre-8.45-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 1226 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_configure)
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_patch: Started
NOTE: Running task 1227 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1228 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1229 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1230 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1233 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1240 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_unpack: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1241 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1242 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1243 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1251 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_write_config)
NOTE: Running task 1252 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.41-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_configure: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1253 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1254 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_patch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_patch: Succeeded
NOTE: Running task 1255 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_deploy_source_date_epoch)
NOTE: Running task 1256 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1282 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_warn_musl)
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe xorgproto-2021.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_patch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: Running task 1283 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_write_config)
NOTE: recipe wayland-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_patch: Succeeded
NOTE: recipe kmod-29-r0: task do_patch: Started
NOTE: Running task 1284 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1285 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1286 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1287 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_patch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_configure: Started
NOTE: Running task 1288 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1289 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.14.0-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.0-r0: task do_patch: Started
NOTE: Running task 1291 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch)
NOTE: Running task 1292 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1293 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_configure: Started
NOTE: Running task 1303 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_write_config: Started
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_patch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_patch: Succeeded
NOTE: Running task 1304 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_configure)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_write_config: Started
NOTE: Running task 1306 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.82.0-r0: task do_patch: Started
NOTE: Running task 1311 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 1312 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1313 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_configure)
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_patch: Succeeded
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Succeeded
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_patch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1314 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_unpack: Succeeded
NOTE: Running task 1315 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_patch)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe xorgproto-2021.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1316 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1317 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_patch)
NOTE: Running task 1326 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_fetch)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_patch: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_write_config: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1327 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_patch)
NOTE: Running task 1328 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1329 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_configure)
NOTE: recipe systemd-1_250.4-r0: task do_warn_musl: Started
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1330 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1351 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_configure)
NOTE: recipe systemd-1_250.4-r0: task do_write_config: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_warn_musl: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_configure: Started
NOTE: Running task 1373 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1374 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1379 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe libseccomp-2.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe expat-2.4.7-r0: task do_configure: Started
NOTE: Running task 1427 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1428 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.44-r0: task do_patch: Succeeded
NOTE: Running task 1429 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_configure)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_fetch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_patch: Started
NOTE: recipe systemd-1_250.4-r0: task do_write_config: Succeeded
NOTE: Running task 1450 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Started
NOTE: Running task 1461 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.9.4-r0: task do_patch: Started
NOTE: recipe dbus-1.14.0-r0: task do_unpack: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_patch: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_patch: Started
NOTE: Running task 1462 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe readline-8.1.2-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: Running task 1463 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_configure)
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1464 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Started
NOTE: Running task 1465 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_patch)
NOTE: Running task 1466 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1467 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: Running task 1468 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Succeeded
NOTE: Running task 1469 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libseccomp-2.5.3-r0: task do_configure: Started
NOTE: recipe xorgproto-2021.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1470 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1471 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_compile)
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.4-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1472 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_configure)
NOTE: recipe openssl-3.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1473 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_configure)
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1474 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_configure)
NOTE: recipe systemd-1_250.4-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1475 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcrypt-1.9.4-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_patch: Succeeded
NOTE: Running task 1476 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1477 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1478 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_configure)
NOTE: recipe elfutils-0.186-r0: task do_unpack: Succeeded
NOTE: Running task 1479 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_patch)
NOTE: Running task 1480 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_patch)
NOTE: Running task 1481 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_patch)
NOTE: Running task 1482 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_configure)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: Running task 1483 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1484 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_configure)
NOTE: Running task 1485 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 1486 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: recipe zstd-1.5.2-r0: task do_configure: Started
NOTE: recipe python3-3.10.3-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Started
NOTE: Running task 1487 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_patch)
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.0-r0: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_configure: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_configure: Started
NOTE: recipe nettle-3.7.3-r0: task do_configure: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: Running task 1488 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_install)
NOTE: recipe zstd-1.5.2-r0: task do_configure: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Started
NOTE: Running task 1489 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_compile)
NOTE: recipe gnutls-3.7.4-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1490 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.44-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.186-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_250.4-r0: task do_patch: Started
NOTE: recipe dbus-1.14.0-r0: task do_patch: Succeeded
NOTE: recipe kmod-29-r0: task do_configure: Started
NOTE: Running task 1491 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.20.0-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_compile: Started
NOTE: Running task 1492 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_patch)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Started
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.4-r0: task do_patch: Succeeded
NOTE: Running task 1493 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.10.3-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1494 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: Running task 1495 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Succeeded
NOTE: Running task 1496 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: Running task 1497 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot)
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_patch: Succeeded
NOTE: Running task 1498 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1499 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_generate_toolchain_file)
NOTE: Running task 1500 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_populate_lic)
NOTE: recipe gnutls-3.7.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_populate_lic unihash changed to 47b2b04b562dfc64a7348e486d04f0c60a53c5f0410422a36585aa109212c49f
NOTE: recipe createrepo-c-0.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 1501 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1502 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_configure_ptest_base)
NOTE: recipe expat-2.4.7-r0: task do_configure_ptest_base: Started
NOTE: recipe systemd-1_250.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1503 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_compile)
NOTE: recipe expat-2.4.7-r0: task do_compile: Started
NOTE: recipe systemd-1_250.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_configure: Succeeded
NOTE: Running task 1504 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_compile)
NOTE: recipe xorgproto-2021.5-r0: task do_compile: Started
NOTE: recipe elfutils-0.186-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_compile: Succeeded
NOTE: Running task 1505 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_deploy_source_date_epoch)
NOTE: Running task 1506 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_install)
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_install: Started
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1507 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Succeeded
NOTE: Running task 1508 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_compile)
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.10.3-r0: task do_patch: Succeeded
NOTE: Running task 1509 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_deploy_source_date_epoch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 1510 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe python3-3.10.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1511 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Started
NOTE: recipe xorgproto-2021.5-r0: task do_install: Succeeded
NOTE: Running task 1512 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot)
NOTE: Running task 1513 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_package)
NOTE: recipe python3-3.10.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Succeeded
NOTE: Running task 1514 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_compile)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot: Started
NOTE: Running task 1515 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe xorgproto-2021.5-r0: task do_package: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Succeeded
NOTE: Running task 1516 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: Running task 1517 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package)
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Succeeded
NOTE: Running task 1518 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Started
NOTE: Running task 1519 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1520 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1521 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1522 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1523 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Succeeded
NOTE: Running task 1524 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_compile)
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Succeeded
NOTE: Running task 1525 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_install)
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1526 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot)
NOTE: Running task 1527 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package)
NOTE: Running task 1528 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: Running task 1529 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1530 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_configure)
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Started
NOTE: Running task 1531 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_configure)
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Started
NOTE: Running task 1532 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot)
NOTE: Running task 1533 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2021.5-r0: task do_package: Succeeded
NOTE: Running task 1534 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata)
NOTE: recipe nettle-3.7.3-r0: task do_configure: Succeeded
NOTE: Running task 1535 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_configure_ptest_base)
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_configure_ptest_base: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1536 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: Running task 1537 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_compile)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe nettle-3.7.3-r0: task do_compile: Started
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: Running task 1538 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Succeeded
NOTE: Running task 1539 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_compile)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1540 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe expat-2.4.7-r0: task do_compile: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: Running task 1541 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_compile_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: Running task 1542 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: Running task 1543 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: recipe expat-2.4.7-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.4.7-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: Running task 1544 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_install)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Succeeded
NOTE: Running task 1545 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_install)
NOTE: recipe expat-2.4.7-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 1546 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_install_ptest_base)
NOTE: recipe expat-2.4.7-r0: task do_install_ptest_base: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_configure: Succeeded
NOTE: Running task 1547 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_compile)
NOTE: recipe expat-2.4.7-r0: task do_install_ptest_base: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_compile: Started
NOTE: Running task 1548 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 1549 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_package)
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe readline-8.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1550 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_compile)
NOTE: recipe expat-2.4.7-r0: task do_package: Started
NOTE: recipe readline-8.1.2-r0: task do_compile: Started
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Succeeded
NOTE: Running task 1551 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot)
NOTE: Running task 1552 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_package)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1553 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1554 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1555 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_compile)
NOTE: recipe libtirpc-1.3.2-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1556 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe readline-8.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1557 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe readline-8.1.2-r0: task do_install: Started
NOTE: recipe expat-2.4.7-r0: task do_package: Succeeded
NOTE: Running task 1558 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_packagedata: Started
NOTE: Running task 1559 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: Running task 1560 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe libtirpc-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1561 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_install: Started
NOTE: recipe expat-2.4.7-r0: task do_packagedata: Failed
NOTE: recipe libseccomp-2.5.3-r0: task do_configure: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_install: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_install: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Succeeded
NOTE: recipe kmod-29-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_configure: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_configure: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_compile: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_configure: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_compile: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1561 tasks of which 1243 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/expat/2.4.7-r0/temp/log.do_packagedata.2389413
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata) failed with exit code '1'

--===============8990413631242575061==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-createrepo-c-upgrade-0.19.0-0.20.0.patch"

From 62d6c509924baac10910cbdacc83e89898d22582 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Apr 2022 06:39:39 +0000
Subject: [PATCH] createrepo-c: upgrade 0.19.0 -> 0.20.0

---
 .../{createrepo-c_0.19.0.bb => createrepo-c_0.20.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_0.19.0.bb => createrepo-c_0.20.0.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_0.19.0.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_0.19.0.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb
index 82351252e5..bc61cac955 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_0.19.0.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "a531ee881a8f1d9273b4383fb9fa604c56fff138"
+SRCREV = "e53188f86f4dfad46f5b81d6931cbaec19e44ea2"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============8990413631242575061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 52 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:44f5a91682072a6cd17c8d45f1ff4bbb850996fe"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 218 Local 12 Mirrors 0 Missed 206 Current 303 (5% match, 60% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 344 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.02.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.25.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running task 370 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 374 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_fetch)
NOTE: Running task 478 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_fetch)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2021e-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: Running task 501 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_fetch)
NOTE: recipe autoconf-archive-2022.02.11-r0: task do_packagedata_setscene: Started
NOTE: Running task 502 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_fetch)
NOTE: Running task 503 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_fetch)
NOTE: Running task 504 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_fetch)
NOTE: Running task 505 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 506 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_fetch)
NOTE: recipe wayland-protocols-1.25-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.2-r0: task do_fetch: Started
NOTE: Running task 739 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_fetch)
NOTE: recipe libtirpc-1.3.2-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 798 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_fetch)
NOTE: Running task 809 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: recipe libffi-3.4.2-r0: task do_fetch: Started
NOTE: Running task 823 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_unpack)
NOTE: recipe sqlite3-3_3.38.2-r0: task do_fetch: Started
NOTE: Running task 824 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: recipe wayland-protocols-1.25-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe autoconf-archive-2022.02.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_fetch: Started
NOTE: Running task 841 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 842 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe sqlite3-3_3.38.2-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 843 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_unpack)
NOTE: Running task 844 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe readline-8.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 845 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_unpack)
NOTE: Running task 846 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_unpack)
NOTE: Running task 847 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_unpack)
NOTE: Running task 848 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 849 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_unpack)
NOTE: Running task 850 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe tzdata-2021e-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 851 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: Running task 852 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 853 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.10.3-r0: task do_fetch: Started
NOTE: recipe expat-2.4.7-r0: task do_fetch: Started
NOTE: Running task 903 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_fetch)
NOTE: Running task 926 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_fetch)
NOTE: Running task 937 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_fetch)
NOTE: Running task 940 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_fetch)
NOTE: Running task 941 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_fetch)
NOTE: Running task 942 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_fetch)
NOTE: Running task 943 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 959 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 968 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_write_config)
NOTE: Running task 969 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_fetch)
NOTE: Running task 984 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot)
NOTE: recipe python3-3.10.3-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: Running task 985 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: Running task 986 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_write_config)
NOTE: Running task 989 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_write_config)
NOTE: Running task 993 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_fetch)
NOTE: Running task 994 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_fetch)
NOTE: Running task 995 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_fetch)
NOTE: Running task 996 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: Running task 997 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_fetch)
NOTE: Running task 998 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_fetch)
NOTE: Running task 999 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_fetch)
NOTE: Running task 1007 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Started
NOTE: Running task 1010 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_unpack)
NOTE: Running task 1011 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe openssl-3.0.2-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running task 1012 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_unpack)
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.1.2-r0: task do_unpack: Started
NOTE: recipe xz-5.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1038 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_unpack)
NOTE: Running task 1039 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: Running task 1040 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_fetch)
NOTE: Running task 1041 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_fetch)
NOTE: Running task 1042 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_fetch)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1046 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_fetch)
NOTE: recipe libffi-3.4.2-r0: task do_unpack: Started
NOTE: recipe xz-5.2.5-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1048 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_fetch)
NOTE: Running task 1049 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_fetch)
NOTE: Running task 1050 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_fetch)
NOTE: Running task 1051 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_fetch)
NOTE: Running task 1056 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1057 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_fetch)
NOTE: Running task 1058 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_fetch)
NOTE: Running task 1059 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_fetch)
NOTE: Running task 1060 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_fetch)
NOTE: Running task 1061 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_fetch)
NOTE: recipe readline-8.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_fetch: Started
NOTE: recipe wayland-1.20.0-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.2-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_fetch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_fetch: Started
NOTE: recipe nettle-3.7.3-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_write_config: Started
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot: Started
NOTE: Running task 1062 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1063 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1064 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_patch)
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Succeeded
NOTE: Running task 1065 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_unpack)
NOTE: Running task 1066 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_unpack)
NOTE: Running task 1067 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_unpack)
NOTE: Running task 1068 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_unpack)
NOTE: Running task 1069 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_unpack)
NOTE: recipe readline-8.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1070 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_unpack)
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_fetch: Started
NOTE: Running task 1071 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_patch)
NOTE: Running task 1072 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_patch)
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Started
NOTE: Running task 1073 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.20.0-r0: task do_write_config: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_fetch: Started
NOTE: Running task 1074 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: Running task 1075 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: Running task 1076 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2021.5-r0: task do_write_config: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_unpack: Started
NOTE: recipe expat-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_write_config: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Succeeded
NOTE: Running task 1077 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_fetch: Started
NOTE: Running task 1078 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: Running task 1079 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1080 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_fetch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Started
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Started
NOTE: Running task 1081 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_unpack)
NOTE: Running task 1082 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 1083 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.4-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Started
NOTE: Running task 1084 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.44-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: Running task 1085 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_unpack)
NOTE: Running task 1086 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_unpack)
NOTE: Running task 1087 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_unpack)
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe kmod-29-r0: task do_fetch: Started
NOTE: recipe elfutils-0.186-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.7.4-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.0-r0: task do_fetch: Started
NOTE: Running task 1088 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: recipe python3-3.10.3-r0: task do_unpack: Started
NOTE: recipe file-5.41-r0: task do_fetch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_patch: Started
NOTE: Running task 1089 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_unpack)
NOTE: recipe wayland-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.2-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Started
NOTE: Running task 1090 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_unpack)
NOTE: Running task 1091 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_unpack)
NOTE: Running task 1092 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: Running task 1093 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1094 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_fetch)
NOTE: Running task 1095 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_unpack)
NOTE: Running task 1096 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_write_config: Succeeded
NOTE: recipe kmod-29-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_unpack: Started
NOTE: recipe nettle-3.7.3-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_patch: Started
NOTE: recipe systemd-1_250.4-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_unpack: Started
NOTE: recipe readline-8.1.2-r0: task do_patch: Started
NOTE: Running task 1102 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_unpack)
NOTE: Running task 1104 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.20.0-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1105 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_patch)
NOTE: Running task 1106 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libseccomp-2.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: Running task 1107 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe expat-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_unpack: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: Running task 1110 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_unpack)
NOTE: Running task 1114 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_unpack)
NOTE: Running task 1115 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_unpack)
NOTE: recipe xorgproto-2021.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1116 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_patch)
NOTE: Running task 1117 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_unpack)
NOTE: Running task 1118 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_unpack)
NOTE: recipe systemd-1_250.4-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Started
NOTE: recipe xz-5.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Started
NOTE: recipe readline-8.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_patch: Succeeded
NOTE: Running task 1144 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xz-5.2.5-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_unpack: Started
NOTE: Running task 1166 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 1167 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_unpack)
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Succeeded
NOTE: Running task 1168 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_unpack)
NOTE: Running task 1169 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_unpack)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: Running task 1170 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1171 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1172 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_unpack)
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_unpack: Started
NOTE: recipe nettle-3.7.3-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_unpack: Started
NOTE: Running task 1173 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.9.4-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.44-r0: task do_unpack: Started
NOTE: Running task 1174 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: Running task 1175 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: recipe libseccomp-2.5.3-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Started
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1176 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 1177 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_patch)
NOTE: Running task 1178 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe gnutls-3.7.4-r0: task do_unpack: Started
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Started
NOTE: Running task 1179 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_patch)
NOTE: recipe dbus-1.14.0-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Succeeded
NOTE: Running task 1180 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_unpack: Started
NOTE: recipe expat-2.4.7-r0: task do_patch: Started
NOTE: Running task 1181 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: recipe wayland-1.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 1182 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_patch)
NOTE: recipe openssl-3.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1183 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_patch)
NOTE: recipe kmod-29-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 1184 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_patch)
NOTE: Running task 1185 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_patch)
NOTE: Running task 1186 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_patch)
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1188 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_patch)
NOTE: Running task 1195 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe xorgproto-2021.5-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Started
NOTE: Running task 1196 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: recipe libxcb-1.14-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_unpack: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1197 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1198 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_patch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_patch: Started
NOTE: Running task 1199 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_patch)
NOTE: recipe systemd-1_250.4-r0: task do_unpack: Started
NOTE: recipe expat-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1200 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_patch)
NOTE: Running task 1201 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_patch)
NOTE: recipe libffi-3.4.2-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1202 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot)
NOTE: recipe readline-8.1.2-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 1203 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1204 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1205 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_generate_toolchain_file)
NOTE: Running task 1206 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1207 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_patch)
NOTE: Running task 1208 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Started
NOTE: Running task 1209 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_patch)
NOTE: recipe wayland-1.20.0-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_unpack: Succeeded
NOTE: Running task 1210 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_patch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_patch: Succeeded
NOTE: recipe kmod-29-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_patch: Started
NOTE: Running task 1211 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_patch)
NOTE: Running task 1212 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_patch)
NOTE: Running task 1213 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 1214 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot)
NOTE: recipe nettle-3.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1215 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1216 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1217 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_patch)
NOTE: Running task 1219 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_unpack)
NOTE: Running task 1220 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1221 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_unpack)
NOTE: recipe libpcre-8.45-r0: task do_patch: Started
NOTE: Running task 1222 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_patch)
NOTE: Running task 1225 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Succeeded
NOTE: recipe file-5.41-r0: task do_patch: Started
NOTE: Running task 1226 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot: Started
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1227 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1228 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_configure)
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.2-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_generate_toolchain_file: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1229 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_patch: Started
NOTE: Running task 1234 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1237 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_write_config)
NOTE: Running task 1245 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_write_config)
NOTE: recipe curl-7.82.0-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Started
NOTE: Running task 1246 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.44-r0: task do_patch: Started
NOTE: Running task 1247 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_configure)
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1248 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_configure)
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Succeeded
NOTE: Running task 1249 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_patch)
NOTE: Running task 1250 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1251 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2021.5-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe libxcb-1.14-r0: task do_patch: Succeeded
NOTE: recipe file-5.41-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_patch: Started
NOTE: recipe elfutils-0.186-r0: task do_unpack: Started
NOTE: Running task 1252 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1253 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1254 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1276 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1277 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1278 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1279 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_patch)
NOTE: Running task 1280 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_deploy_source_date_epoch)
NOTE: Running task 1281 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1282 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1287 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_warn_musl)
NOTE: Running task 1288 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_write_config)
NOTE: recipe xcb-proto-1.14.1-r0: task do_patch: Succeeded
NOTE: Running task 1299 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 1305 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_configure: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_patch: Succeeded
NOTE: Running task 1306 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1307 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: Running task 1308 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1309 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_write_config: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1310 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.7.3-r0: task do_patch: Succeeded
NOTE: Running task 1311 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe xz-5.2.5-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_configure: Started
NOTE: Running task 1312 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.82.0-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_unpack: Succeeded
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1313 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_patch)
NOTE: recipe openssl-3.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1314 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_patch)
NOTE: recipe xorgproto-2021.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1315 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_patch)
NOTE: recipe libarchive-3.6.0-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1316 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1317 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_write_config: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1318 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_configure)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_write_config: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1319 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe kmod-29-r0: task do_patch: Succeeded
NOTE: Running task 1320 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1321 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_configure)
NOTE: recipe wayland-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1322 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1331 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_fetch)
NOTE: Running task 1333 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_configure)
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: Running task 1334 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_deploy_source_date_epoch)
NOTE: Running task 1340 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-1_250.4-r0: task do_warn_musl: Started
NOTE: recipe systemd-1_250.4-r0: task do_write_config: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1341 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: recipe systemd-1_250.4-r0: task do_warn_musl: Succeeded
NOTE: recipe libgcrypt-1.9.4-r0: task do_patch: Started
NOTE: Running task 1342 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_configure)
NOTE: Running task 1343 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_configure)
NOTE: recipe libgpg-error-1.44-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_patch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1386 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: Running task 1387 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_patch)
NOTE: Running task 1388 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_deploy_source_date_epoch)
NOTE: Running task 1389 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Started
NOTE: recipe libgpg-error-1.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_write_config: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_configure: Started
NOTE: recipe expat-2.4.7-r0: task do_configure: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1464 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.4-r0: task do_unpack: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: Running task 1465 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_configure)
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_configure: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1466 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_configure)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Succeeded
NOTE: Running task 1467 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_configure)
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.44-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1468 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_patch)
NOTE: recipe wayland-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1469 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1470 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_compile)
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_patch: Started
NOTE: Running task 1471 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1472 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_configure)
NOTE: recipe libarchive-3.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_unpack: Succeeded
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1473 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_configure)
NOTE: recipe dbus-1.14.0-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1474 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_configure)
NOTE: recipe libgcrypt-1.9.4-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_patch: Succeeded
NOTE: Running task 1475 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 1476 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_patch)
NOTE: Running task 1477 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_configure)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_unpack: Succeeded
NOTE: Running task 1478 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1479 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_patch)
NOTE: Running task 1480 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.10.3-r0: task do_unpack: Succeeded
NOTE: Running task 1481 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: Running task 1482 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_configure)
NOTE: Running task 1483 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1484 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1485 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Started
NOTE: Running task 1486 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: recipe xorgproto-2021.5-r0: task do_configure: Started
NOTE: recipe zstd-1.5.2-r0: task do_configure: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Started
NOTE: Running task 1487 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_unpack)
NOTE: Running task 1488 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 1489 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.4-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe nettle-3.7.3-r0: task do_configure: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Started
NOTE: recipe openssl-3.0.2-r0: task do_configure: Started
NOTE: Running task 1490 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_install)
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.2-r0: task do_configure: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_configure: Started
NOTE: Running task 1491 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe elfutils-0.186-r0: task do_patch: Started
NOTE: recipe kmod-29-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-1_250.4-r0: task do_patch: Started
NOTE: recipe dbus-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.4-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: Running task 1492 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.20.0-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Started
NOTE: recipe zstd-1.5.2-r0: task do_compile: Started
NOTE: recipe python3-3.10.3-r0: task do_patch: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: Running task 1493 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe gnutls-3.7.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1494 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_patch)
NOTE: recipe dbus-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1495 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot)
NOTE: recipe libgcrypt-1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: Running task 1496 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe createrepo-c-0.20.0-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe gnutls-3.7.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1497 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_patch: Succeeded
NOTE: Running task 1498 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1499 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_generate_toolchain_file)
NOTE: Running task 1500 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_populate_lic)
NOTE: recipe systemd-1_250.4-r0: task do_patch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_populate_lic: Started
NOTE: Running task 1501 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_populate_lic unihash changed to 47b2b04b562dfc64a7348e486d04f0c60a53c5f0410422a36585aa109212c49f
NOTE: recipe createrepo-c-0.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 1502 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_configure_ptest_base)
NOTE: recipe xorgproto-2021.5-r0: task do_configure: Succeeded
NOTE: Running task 1503 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_compile)
NOTE: recipe expat-2.4.7-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.186-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_compile: Started
NOTE: recipe expat-2.4.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1504 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_deploy_source_date_epoch)
NOTE: Running task 1505 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_compile)
NOTE: recipe xorgproto-2021.5-r0: task do_compile: Succeeded
NOTE: Running task 1506 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_install)
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.7-r0: task do_compile: Started
NOTE: recipe xorgproto-2021.5-r0: task do_install: Started
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1507 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-3.10.3-r0: task do_patch: Succeeded
NOTE: Running task 1508 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_deploy_source_date_epoch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Succeeded
NOTE: Running task 1509 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_compile)
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1510 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Started
NOTE: recipe python3-3.10.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Succeeded
NOTE: Running task 1511 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_install)
NOTE: recipe xorgproto-2021.5-r0: task do_install: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Succeeded
NOTE: Running task 1512 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot)
NOTE: Running task 1513 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_compile)
NOTE: Running task 1514 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_package)
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Started
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Started
NOTE: recipe python3-3.10.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1515 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe xorgproto-2021.5-r0: task do_package: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Succeeded
NOTE: Running task 1516 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Succeeded
NOTE: Running task 1517 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot)
NOTE: Running task 1518 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package)
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1519 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1520 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1521 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1522 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1523 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Succeeded
NOTE: Running task 1524 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_compile)
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1525 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot)
NOTE: Running task 1526 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Started
NOTE: Running task 1527 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_install)
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1528 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: Running task 1529 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_configure)
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1530 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_configure)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1531 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_configure)
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Succeeded
NOTE: Running task 1532 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot)
NOTE: Running task 1533 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Started
NOTE: recipe xorgproto-2021.5-r0: task do_package: Succeeded
NOTE: Running task 1534 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Succeeded
NOTE: Running task 1535 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe nettle-3.7.3-r0: task do_configure: Succeeded
NOTE: Running task 1536 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_configure_ptest_base)
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_configure_ptest_base: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Succeeded
NOTE: Running task 1537 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata)
NOTE: recipe nettle-3.7.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1538 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_compile)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1539 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Started
NOTE: recipe nettle-3.7.3-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1540 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Succeeded
NOTE: Running task 1541 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_compile)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: Running task 1542 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_configure: Succeeded
NOTE: Running task 1543 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_compile)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: Running task 1544 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_install)
NOTE: recipe expat-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 1545 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_compile_ptest_base)
NOTE: recipe sqlite3-3_3.38.2-r0: task do_compile: Started
NOTE: recipe expat-2.4.7-r0: task do_compile_ptest_base: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Started
NOTE: recipe expat-2.4.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1546 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_install)
NOTE: recipe expat-2.4.7-r0: task do_install: Started
NOTE: recipe expat-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 1547 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_install_ptest_base)
NOTE: recipe readline-8.1.2-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1548 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_compile)
NOTE: Running task 1549 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe expat-2.4.7-r0: task do_install_ptest_base: Started
NOTE: recipe readline-8.1.2-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe expat-2.4.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1550 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_populate_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1551 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_package)
NOTE: Running task 1552 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe expat-2.4.7-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Succeeded
NOTE: Running task 1553 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot)
NOTE: Running task 1554 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_package)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1555 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1556 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: Running task 1557 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe libtirpc-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1558 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe readline-8.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1559 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_install)
NOTE: recipe readline-8.1.2-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1560 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.4.7-r0: task do_package: Succeeded
NOTE: Running task 1561 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata)
NOTE: recipe libtirpc-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1562 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_install)
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_configure: Succeeded
NOTE: Running task 1563 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure)
NOTE: Running task 1564 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_configure_ptest_base)
NOTE: recipe expat-2.4.7-r0: task do_packagedata: Started
NOTE: recipe libpcre-8.45-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_configure_ptest_base: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_install: Started
NOTE: recipe readline-8.1.2-r0: task do_install: Succeeded
NOTE: Running task 1565 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot)
NOTE: Running task 1566 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_package)
NOTE: recipe libseccomp-2.5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1567 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_compile)
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_compile: Started
NOTE: recipe expat-2.4.7-r0: task do_packagedata: Failed
NOTE: recipe readline-8.1.2-r0: task do_package: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_install: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_configure: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_package: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Succeeded
NOTE: recipe kmod-29-r0: task do_configure: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_configure: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_configure: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_compile: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_compile: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_configure: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_compile: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_configure: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1567 tasks of which 1243 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/expat/2.4.7-r0/temp/log.do_packagedata.2217431
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata) failed with exit code '1'

--===============8990413631242575061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1641 targets, 50 skipped, 0 masked, 0 errors.
Removing 99 recipes from the core2-32 sysroot...done.
Removing 99 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.0.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:44f5a91682072a6cd17c8d45f1ff4bbb850996fe"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 253 Local 108 Mirrors 0 Missed 145 Current 156 (42% match, 64% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 168 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 180 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 221 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 230 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 231 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 232 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 305 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running task 452 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 527 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_fetch)
NOTE: Running task 577 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_fetch)
NOTE: Running task 586 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_fetch)
NOTE: Running task 587 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_fetch)
NOTE: Running task 588 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_fetch)
NOTE: Running task 596 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_fetch)
NOTE: Running task 597 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 598 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_fetch)
NOTE: Running task 601 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: Running task 624 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_fetch)
NOTE: Running task 625 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_fetch)
NOTE: Running task 646 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 649 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 650 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 661 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_fetch)
NOTE: Running task 662 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_fetch)
NOTE: Running task 665 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_fetch)
NOTE: Running task 666 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_fetch)
NOTE: Running task 669 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_fetch)
NOTE: Running task 685 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_fetch)
NOTE: Running task 686 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_fetch)
NOTE: Running task 687 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_fetch)
NOTE: Running task 688 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_fetch)
NOTE: Running task 689 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_fetch)
NOTE: Running task 702 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_write_config)
NOTE: Running task 703 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_fetch)
NOTE: Running task 704 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_fetch)
NOTE: Running task 705 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_fetch)
NOTE: Running task 706 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_fetch)
NOTE: Running task 707 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 708 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: Running task 709 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_fetch)
NOTE: Running task 710 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 711 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_fetch)
NOTE: Running task 713 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_fetch: Started
NOTE: recipe nettle-3.7.3-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_fetch: Started
NOTE: recipe expat-2.4.7-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.2-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_fetch: Started
NOTE: recipe xz-5.2.5-r0: task do_fetch: Started
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 751 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: recipe nettle-3.7.3-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 752 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: recipe libtirpc-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_fetch: Started
NOTE: recipe libgpg-error-1.44-r0: task do_fetch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 753 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: recipe sqlite3-3_3.38.2-r0: task do_fetch: Succeeded
NOTE: Running task 754 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_unpack)
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Started
NOTE: Running task 755 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_unpack)
NOTE: Running task 756 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_unpack)
NOTE: Running task 757 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_unpack)
NOTE: recipe openssl-3.0.2-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: Running task 758 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_unpack)
NOTE: recipe libgpg-error-1.44-r0: task do_fetch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Started
NOTE: recipe libffi-3.4.2-r0: task do_fetch: Succeeded
NOTE: Running task 759 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_unpack)
NOTE: recipe argp-standalone-1.3-r0: task do_fetch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 760 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: Running task 761 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_unpack)
NOTE: Running task 762 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_unpack)
NOTE: Running task 763 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_unpack)
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_fetch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Started
NOTE: recipe file-5.41-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_fetch: Started
NOTE: recipe fts-1.2.7-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.0-r0: task do_fetch: Started
NOTE: Running task 764 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_unpack)
NOTE: recipe musl-obstack-1.1-r0: task do_fetch: Started
NOTE: Running task 765 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: Running task 766 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_unpack)
NOTE: Running task 767 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_unpack)
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: Running task 768 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_write_config: Started
NOTE: recipe gnutls-3.7.4-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.0-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_fetch: Started
NOTE: Running task 769 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_fetch: Succeeded
NOTE: recipe file-5.41-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.9.4-r0: task do_fetch: Succeeded
NOTE: Running task 770 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 771 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_unpack)
NOTE: Running task 772 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: recipe python3-3.10.3-r0: task do_fetch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Succeeded
NOTE: recipe gnutls-3.7.4-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_fetch: Started
NOTE: Running task 773 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_unpack)
NOTE: Running task 774 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_unpack)
NOTE: recipe createrepo-c-0.20.0-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: Running task 775 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_unpack)
NOTE: recipe bash-5.1.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 776 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_unpack)
NOTE: Running task 777 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_unpack)
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_unpack: Started
NOTE: recipe elfutils-0.186-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_write_config: Succeeded
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: recipe nettle-3.7.3-r0: task do_unpack: Started
NOTE: Running task 780 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_unpack)
NOTE: recipe xz-5.2.5-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_unpack: Started
NOTE: Running task 782 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: Running task 783 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_unpack)
NOTE: Running task 786 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe python3-3.10.3-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_unpack: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: Running task 790 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_unpack)
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Started
NOTE: Running task 791 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_unpack: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.2-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.2-r0: task do_unpack: Started
NOTE: recipe libarchive-3.6.0-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe curl-7.82.0-r0: task do_unpack: Started
NOTE: recipe file-5.41-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Started
NOTE: recipe xz-5.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 796 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe gnutls-3.7.4-r0: task do_unpack: Started
NOTE: Running task 797 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Started
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe expat-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_unpack: Succeeded
NOTE: Running task 802 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_patch)
NOTE: Running task 803 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_patch)
NOTE: Running task 804 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_patch)
NOTE: recipe libseccomp-2.5.3-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.2-r0: task do_unpack: Succeeded
NOTE: Running task 805 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_patch)
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: Running task 806 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_patch)
NOTE: Running task 807 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe readline-8.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: Running task 808 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_patch)
NOTE: Running task 809 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: Running task 810 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: Running task 811 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_patch)
NOTE: Running task 812 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe xz-5.2.5-r0: task do_patch: Started
NOTE: Running task 813 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_patch)
NOTE: recipe python3-3.10.3-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_patch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: recipe file-5.41-r0: task do_unpack: Succeeded
NOTE: Running task 814 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_patch)
NOTE: Running task 815 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: recipe libtirpc-1.3.2-r0: task do_patch: Started
NOTE: recipe expat-2.4.7-r0: task do_patch: Started
NOTE: recipe nettle-3.7.3-r0: task do_patch: Started
NOTE: recipe libarchive-3.6.0-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.44-r0: task do_unpack: Succeeded
NOTE: Running setscene task 323 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 324 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 325 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 327 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_populate_sysroot_setscene)
NOTE: Running task 816 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_patch)
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: Running task 821 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: recipe libffi-3.4.2-r0: task do_patch: Started
NOTE: recipe readline-8.1.2-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: Running task 822 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_patch)
NOTE: recipe createrepo-c-0.20.0-r0: task do_unpack: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_fetch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_patch: Succeeded
NOTE: Running task 823 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_patch)
NOTE: Running task 824 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 825 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_unpack)
NOTE: Running task 826 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_patch)
NOTE: recipe musl-obstack-1.1-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Started
NOTE: Running task 827 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_unpack)
NOTE: recipe sqlite3-3_3.38.2-r0: task do_patch: Succeeded
NOTE: recipe file-5.41-r0: task do_patch: Started
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 828 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libtirpc-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: Running task 829 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 830 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.6.0-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.7-r0: task do_patch: Succeeded
NOTE: Running task 831 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_generate_toolchain_file)
NOTE: recipe libseccomp-2.5.3-r0: task do_patch: Succeeded
NOTE: Running task 832 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.2-r0: task do_patch: Started
NOTE: Running task 833 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libgpg-error-1.44-r0: task do_patch: Started
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fts-1.2.7-r0: task do_unpack: Started
NOTE: recipe curl-7.82.0-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_unpack: Started
NOTE: Running task 834 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_patch)
NOTE: Running task 835 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch)
NOTE: Running task 836 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 837 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: Running task 838 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_patch)
NOTE: Running task 839 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Succeeded
NOTE: Running task 840 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe sqlite3-3_3.38.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe file-5.41-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: Running task 841 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_deploy_source_date_epoch)
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libarchive-3.6.0-r0: task do_patch: Succeeded
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 842 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 843 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_generate_toolchain_file: Started
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 844 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.2-r0: task do_patch: Succeeded
NOTE: Running task 845 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: recipe libffi-3.4.2-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 846 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe fts-1.2.7-r0: task do_unpack: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_unpack: Succeeded
NOTE: Running task 847 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe readline-8.1.2-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 334 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 335 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 856 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_patch)
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 857 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_patch)
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 858 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_deploy_source_date_epoch)
NOTE: recipe openssl-3.0.2-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_patch: Started
NOTE: recipe nettle-3.7.3-r0: task do_patch: Succeeded
NOTE: Running task 863 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_patch)
NOTE: recipe expat-2.4.7-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 864 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 338 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 339 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 340 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.37.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 342 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 343 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 344 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 345 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 346 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 347 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 865 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 866 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_generate_toolchain_file)
NOTE: Running task 867 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_populate_lic)
NOTE: recipe libgpg-error-1.44-r0: task do_patch: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_patch: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-obstack-1.1-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 868 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_patch)
NOTE: recipe fts-1.2.7-r0: task do_patch: Started
NOTE: Running task 869 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch)
NOTE: Running task 870 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 871 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_deploy_source_date_epoch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_patch: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Succeeded
NOTE: Running task 872 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_patch)
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 873 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_patch)
NOTE: recipe musl-obstack-1.1-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.9.4-r0: task do_patch: Started
NOTE: recipe util-linux-2.37.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 874 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_deploy_source_date_epoch)
NOTE: recipe fts-1.2.7-r0: task do_patch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.82.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.44-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 875 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.4-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 876 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_patch)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 877 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_fetch)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ncurses-6.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 352 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_setscene)
NOTE: recipe libxml2-2.9.13-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_patch: Started
NOTE: recipe util-linux-libuuid-2.37.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_populate_lic: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_populate_lic unihash changed to 47b2b04b562dfc64a7348e486d04f0c60a53c5f0410422a36585aa109212c49f
NOTE: recipe ncurses-6.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.4-r0: task do_patch: Started
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_fetch: Started
NOTE: Running setscene task 357 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.7.4-r0: task do_patch: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_unpack: Succeeded
NOTE: Running setscene task 358 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.9.4-r0: task do_patch: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_fetch: Succeeded
NOTE: Running task 883 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 361 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 362 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 363 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 364 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 898 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_unpack)
NOTE: Running task 900 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 901 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 902 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 903 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_patch)
NOTE: Running task 904 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 905 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 906 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.7.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe elfutils-0.186-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-linux-2.37.4-r0: task do_unpack: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.10.3-r0: task do_unpack: Succeeded
NOTE: Running task 911 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_patch)
NOTE: recipe openssl-3.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgcrypt-1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 371 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 372 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.10.3-r0: task do_patch: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 374 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 375 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 377 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 379 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.37.4-r0: task do_unpack: Succeeded
NOTE: Running task 932 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_patch)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_patch: Started
NOTE: Running setscene task 382 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_packagedata_setscene)
NOTE: recipe elfutils-0.186-r0: task do_patch: Succeeded
NOTE: Running task 933 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 384 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 386 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.37.4-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+6d8a515796-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+6d8a515796-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 388 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 389 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 390 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_fetch: Succeeded
NOTE: Running setscene task 391 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 939 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+6d8a515796-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_unpack: Started
NOTE: recipe argp-standalone-1.3-r0: task do_unpack: Succeeded
NOTE: Running task 940 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_patch)
NOTE: recipe python3-3.10.3-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 941 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_deploy_source_date_epoch)
NOTE: recipe argp-standalone-1.3-r0: task do_patch: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+6d8a515796-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 396 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 397 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.10.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 402 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.3-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 962 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.10.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe argp-standalone-1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 406 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 407 of 409 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1045 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1050 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1077 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1093 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1094 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1095 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1096 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1111 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1125 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1126 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1127 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1128 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1133 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1140 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1141 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1145 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1150 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe openssl-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1151 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1162 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe readline-8.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xz-5.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libffi-3.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1194 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1207 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe nettle-3.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.37.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe argp-standalone-1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgpg-error-1.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-obstack-1.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1208 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_configure)
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1209 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1210 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe zstd-1.5.2-r0: task do_configure: Started
NOTE: recipe openssl-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1211 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_configure)
NOTE: recipe libtirpc-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1212 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_configure)
NOTE: recipe libffi-3.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1213 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_configure)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe xz-5.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1214 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_configure)
NOTE: recipe zstd-1.5.2-r0: task do_configure: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1215 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_configure)
NOTE: Running task 1216 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_configure)
NOTE: Running task 1217 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_compile)
NOTE: recipe argp-standalone-1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: Running task 1218 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_configure)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1219 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_configure)
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_configure: Started
NOTE: Running task 1220 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_configure)
NOTE: Running task 1221 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: recipe musl-obstack-1.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1222 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe util-linux-2.37.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1223 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_configure)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1224 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_configure)
NOTE: Running task 1225 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_configure)
NOTE: Running task 1226 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_configure)
NOTE: Running task 1227 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_configure)
NOTE: Running task 1228 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe xz-5.2.5-r0: task do_configure: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_configure: Started
NOTE: recipe zstd-1.5.2-r0: task do_compile: Started
NOTE: Running task 1229 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe readline-8.1.2-r0: task do_configure: Started
NOTE: recipe argp-standalone-1.3-r0: task do_configure: Started
NOTE: recipe expat-2.4.7-r0: task do_configure: Started
NOTE: recipe nettle-3.7.3-r0: task do_configure: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.44-r0: task do_configure: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_configure: Started
NOTE: recipe musl-obstack-1.1-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe fts-1.2.7-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe util-linux-2.37.4-r0: task do_configure: Started
NOTE: recipe expat-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 1230 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_configure_ptest_base)
NOTE: recipe expat-2.4.7-r0: task do_configure_ptest_base: Started
NOTE: recipe expat-2.4.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1231 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_compile)
NOTE: recipe expat-2.4.7-r0: task do_compile: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_configure: Succeeded
NOTE: Running task 1232 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_configure_ptest_base)
NOTE: recipe nettle-3.7.3-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.7.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1233 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_compile)
NOTE: recipe nettle-3.7.3-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.3-r0: task do_configure: Succeeded
NOTE: Running task 1234 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_compile)
NOTE: recipe argp-standalone-1.3-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.3-r0: task do_compile: Succeeded
NOTE: Running task 1235 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: Running task 1236 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: recipe argp-standalone-1.3-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1237 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe argp-standalone-1.3-r0: task do_install: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_configure: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: Running task 1238 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_compile)
NOTE: Running task 1239 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_populate_sysroot)
NOTE: Running task 1240 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package)
NOTE: recipe readline-8.1.2-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package: Started
NOTE: recipe argp-standalone-1.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_configure: Succeeded
NOTE: Running task 1241 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_compile)
NOTE: recipe musl-obstack-1.1-r0: task do_configure: Succeeded
NOTE: Running task 1242 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_compile)
NOTE: recipe sqlite3-3_3.38.2-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.1-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.1-r0: task do_compile: Succeeded
NOTE: Running task 1243 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_install)
NOTE: recipe expat-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 1244 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_compile_ptest_base)
NOTE: recipe readline-8.1.2-r0: task do_compile: Succeeded
NOTE: Running task 1245 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_install)
NOTE: recipe expat-2.4.7-r0: task do_compile_ptest_base: Started
NOTE: recipe musl-obstack-1.1-r0: task do_install: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_install: Started
NOTE: Running task 1246 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_install)
NOTE: recipe fts-1.2.7-r0: task do_configure: Succeeded
NOTE: Running task 1247 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata)
NOTE: Running task 1248 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_compile)
NOTE: recipe fts-1.2.7-r0: task do_compile: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata: Started
NOTE: recipe expat-2.4.7-r0: task do_install: Started
NOTE: recipe musl-obstack-1.1-r0: task do_install: Succeeded
NOTE: Running task 1249 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot)
NOTE: Running task 1250 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package)
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package: Started
NOTE: recipe expat-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 1251 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_install_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1252 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_install_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1253 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe fts-1.2.7-r0: task do_compile: Succeeded
NOTE: Running task 1254 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_install)
NOTE: Running task 1255 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 1256 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_package)
NOTE: recipe readline-8.1.2-r0: task do_install: Succeeded
NOTE: Running task 1257 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot)
NOTE: recipe musl-obstack-1.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1258 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_install: Started
NOTE: recipe expat-2.4.7-r0: task do_package: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot: Started
NOTE: recipe readline-8.1.2-r0: task do_package: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 1259 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_compile)
NOTE: recipe fts-1.2.7-r0: task do_install: Succeeded
NOTE: Running task 1260 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot)
NOTE: Running task 1261 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package)
NOTE: recipe libtirpc-1.3.2-r0: task do_compile: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1262 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1263 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: Running task 1264 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_install)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1265 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1266 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_install: Started
NOTE: Running task 1267 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 1268 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_compile: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_install: Succeeded
NOTE: Running task 1269 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_install)
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1270 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package)
NOTE: Running task 1271 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe libtirpc-1.3.2-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_package: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1272 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_compile: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package: Succeeded
NOTE: Running task 1273 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata)
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 1274 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 1275 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_package)
NOTE: recipe libseccomp-2.5.3-r0: task do_configure: Succeeded
NOTE: Running task 1276 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_configure_ptest_base)
NOTE: recipe libtirpc-1.3.2-r0: task do_package: Started
NOTE: recipe expat-2.4.7-r0: task do_package: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_configure_ptest_base: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1277 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata)
NOTE: recipe libseccomp-2.5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1278 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_compile)
NOTE: recipe libffi-3.4.2-r0: task do_configure: Succeeded
NOTE: Running task 1279 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_compile)
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_packagedata: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_compile: Started
NOTE: Running task 1280 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_install)
NOTE: Running task 1281 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe libffi-3.4.2-r0: task do_compile: Started
NOTE: recipe fts-1.2.7-r0: task do_package: Succeeded
NOTE: recipe popt-1.18-r0: task do_install: Started
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1282 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata)
NOTE: recipe readline-8.1.2-r0: task do_package: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata: Started
NOTE: Running task 1283 of 1478 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_packagedata)
NOTE: recipe expat-2.4.7-r0: task do_packagedata: Failed
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_packagedata: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package: Succeeded
NOTE: recipe popt-1.18-r0: task do_install: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_compile: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_compile: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_package: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_configure: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_configure: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_configure: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_compile: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_compile: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_compile: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_configure: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1283 tasks of which 1039 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/expat/2.4.7-r0/temp/log.do_packagedata.2474295
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata) failed with exit code '1'

--===============8990413631242575061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1640 targets, 62 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.0"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:44f5a91682072a6cd17c8d45f1ff4bbb850996fe"
workspace            = "master:ee5f9d9fdd7d09aa3a86a19d07e3e64851ddc686"

Initialising tasks...done.
Sstate summary: Wanted 218 Local 12 Mirrors 0 Missed 206 Current 303 (5% match, 60% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 344 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/autoconf-archive/autoconf-archive_2022.02.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 371 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.25.bb:do_packagedata_setscene)
NOTE: Running setscene task 443 of 521 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running task 370 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_fetch)
NOTE: Running task 374 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_fetch)
NOTE: Running task 478 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_fetch)
NOTE: Running task 501 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_fetch)
NOTE: Running task 502 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_fetch)
NOTE: Running task 503 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_fetch)
NOTE: Running task 504 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_fetch)
NOTE: Running task 505 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_fetch)
NOTE: Running task 506 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_fetch)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe tzdata-2021e-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe autoconf-archive-2022.02.11-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.25-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.2-r0: task do_fetch: Started
NOTE: Running task 739 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_fetch)
NOTE: recipe libtirpc-1.3.2-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.2-r0: task do_fetch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_fetch: Started
NOTE: recipe xz-5.2.5-r0: task do_fetch: Started
NOTE: Running task 798 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_fetch)
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Started
NOTE: Running task 800 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_unpack)
NOTE: Running task 801 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_fetch: Started
NOTE: Running task 811 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_fetch)
NOTE: recipe sqlite3-3_3.38.2-r0: task do_fetch: Succeeded
NOTE: Running task 820 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_unpack)
NOTE: recipe xz-5.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 821 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-protocols-1.25-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_fetch: Succeeded
NOTE: recipe autoconf-archive-2022.02.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 822 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_unpack)
NOTE: recipe readline-8.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 823 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_unpack)
NOTE: recipe libnsl2-2.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 824 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_unpack)
NOTE: Running task 825 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_unpack)
NOTE: Running task 826 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 827 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_unpack)
NOTE: Running task 828 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_unpack)
NOTE: Running task 829 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 830 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 831 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe python3-3.10.3-r0: task do_fetch: Started
NOTE: recipe tzdata-2021e-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 832 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_prepare_recipe_sysroot)
NOTE: Setscene tasks completed
NOTE: recipe expat-2.4.7-r0: task do_fetch: Started
NOTE: recipe expat-2.4.7-r0: task do_fetch: Succeeded
NOTE: Running task 925 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_fetch)
NOTE: Running task 936 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_fetch)
NOTE: Running task 939 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_fetch)
NOTE: Running task 940 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_fetch)
NOTE: Running task 941 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_fetch)
NOTE: Running task 942 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_fetch)
NOTE: Running task 943 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_fetch)
NOTE: Running task 959 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_fetch)
NOTE: Running task 968 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_write_config)
NOTE: Running task 969 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_fetch)
NOTE: Running task 984 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.37.4.bb:do_populate_sysroot)
NOTE: recipe python3-3.10.3-r0: task do_fetch: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Started
NOTE: recipe openssl-3.0.2-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre-8.45-r0: task do_fetch: Started
NOTE: Running task 985 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_unpack)
NOTE: Running task 986 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.2-r0: task do_unpack: Started
NOTE: recipe xz-5.2.5-r0: task do_unpack: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_unpack: Started
NOTE: Running task 987 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_fetch)
NOTE: Running task 988 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_write_config)
NOTE: Running task 991 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_write_config)
NOTE: Running task 995 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_fetch)
NOTE: Running task 996 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_fetch)
NOTE: Running task 997 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_fetch)
NOTE: Running task 998 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_fetch)
NOTE: Running task 999 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_fetch)
NOTE: Running task 1000 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_fetch)
NOTE: Running task 1001 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_fetch)
NOTE: recipe libxml2-2.9.13-r0: task do_fetch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_fetch: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1004 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_unpack)
NOTE: Running task 1010 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_fetch)
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1038 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_fetch)
NOTE: Running task 1039 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_fetch)
NOTE: Running task 1040 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_fetch)
NOTE: Running task 1045 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_fetch)
NOTE: Running task 1046 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_fetch)
NOTE: Running task 1047 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_fetch)
NOTE: Running task 1048 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_fetch)
NOTE: Running task 1049 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_fetch)
NOTE: Running task 1054 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_fetch)
NOTE: Running task 1055 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_fetch)
NOTE: Running task 1056 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_fetch)
NOTE: Running task 1057 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_fetch)
NOTE: Running task 1058 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_fetch)
NOTE: Running task 1059 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_fetch)
NOTE: Running task 1060 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_unpack)
NOTE: recipe readline-8.1.2-r0: task do_unpack: Started
NOTE: recipe xz-5.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.1.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1061 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_unpack)
NOTE: recipe libffi-3.4.2-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_unpack: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_fetch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_fetch: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_fetch: Started
NOTE: recipe nettle-3.7.3-r0: task do_fetch: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_fetch: Started
NOTE: recipe wayland-1.20.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.20.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_unpack: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_fetch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_fetch: Started
NOTE: Running task 1062 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_fetch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_fetch: Started
NOTE: recipe libunistring-1.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_write_config: Started
NOTE: Running task 1063 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_patch)
NOTE: Running task 1064 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_patch)
NOTE: recipe readline-8.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1065 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_unpack)
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Started
NOTE: Running task 1066 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_unpack)
NOTE: Running task 1067 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_unpack)
NOTE: Running task 1068 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_unpack)
NOTE: Running task 1069 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_unpack: Started
NOTE: Running task 1070 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_patch)
NOTE: Running task 1071 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_unpack)
NOTE: Running task 1072 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_unpack)
NOTE: recipe expat-2.4.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1073 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_patch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Started
NOTE: Running task 1074 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_patch)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_fetch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.20.0-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_write_config: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_fetch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_write_config: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_fetch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_fetch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_fetch: Succeeded
NOTE: Running task 1075 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_unpack)
NOTE: Running task 1076 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgpg-error-1.44-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_fetch: Started
NOTE: recipe zstd-1.5.2-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_fetch: Succeeded
NOTE: recipe file-5.41-r0: task do_fetch: Started
NOTE: Running task 1077 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_unpack)
NOTE: Running task 1078 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1079 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_patch)
NOTE: Running task 1080 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe curl-7.82.0-r0: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.9.4-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.4-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_fetch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_fetch: Started
NOTE: Running task 1081 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe file-5.41-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_fetch: Succeeded
NOTE: recipe kmod-29-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Started
NOTE: recipe libarchive-3.6.0-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe gnutls-3.7.4-r0: task do_fetch: Succeeded
NOTE: recipe libx11-1_1.7.3.1-r0: task do_fetch: Succeeded
NOTE: Running task 1082 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_unpack)
NOTE: recipe wayland-1.20.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_write_config: Succeeded
NOTE: Running task 1083 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_unpack)
NOTE: Running task 1084 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.4.0-r0: task do_fetch: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_fetch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Started
NOTE: recipe libpcre-8.45-r0: task do_unpack: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_fetch: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1085 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_unpack)
NOTE: Running task 1086 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_unpack)
NOTE: Running task 1087 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_unpack)
NOTE: Running task 1088 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_unpack)
NOTE: Running task 1089 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_unpack)
NOTE: Running task 1090 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_unpack)
NOTE: recipe libffi-3.4.2-r0: task do_patch: Started
NOTE: Running task 1091 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_unpack)
NOTE: recipe libtirpc-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_unpack: Succeeded
NOTE: Running task 1092 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_unpack)
NOTE: Running task 1093 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_fetch)
NOTE: Running task 1094 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_fetch)
NOTE: Running task 1095 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_unpack)
NOTE: Running task 1096 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_unpack)
NOTE: Running task 1102 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_unpack)
NOTE: Running task 1104 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-29-r0: task do_fetch: Succeeded
NOTE: recipe python3-3.10.3-r0: task do_unpack: Started
NOTE: recipe systemd-1_250.4-r0: task do_fetch: Started
NOTE: recipe xz-5.2.5-r0: task do_patch: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_patch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Started
NOTE: recipe nettle-3.7.3-r0: task do_unpack: Started
NOTE: recipe wayland-1.20.0-r0: task do_unpack: Started
NOTE: Running task 1105 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.1.2-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_unpack: Started
NOTE: recipe openssl-3.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1106 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_patch)
NOTE: Running task 1107 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.186-r0: task do_fetch: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_unpack: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Started
NOTE: recipe libunistring-1.0-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1108 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_patch)
NOTE: Running task 1112 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_unpack)
NOTE: Running task 1115 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_unpack)
NOTE: recipe systemd-1_250.4-r0: task do_fetch: Succeeded
NOTE: Running task 1116 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_unpack)
NOTE: recipe lzo-2.10-r0: task do_unpack: Started
NOTE: Running task 1117 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_unpack)
NOTE: Running task 1118 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_unpack)
NOTE: recipe libffi-3.4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_unpack: Started
NOTE: recipe nettle-3.7.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Started
NOTE: Running task 1134 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_deploy_source_date_epoch)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe readline-8.1.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Started
NOTE: recipe xz-5.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_patch: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Started
NOTE: recipe lzo-2.10-r0: task do_unpack: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Started
NOTE: Running task 1160 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1167 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_unpack)
NOTE: Running task 1168 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_unpack)
NOTE: Running task 1169 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_unpack)
NOTE: Running task 1170 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_unpack)
NOTE: Running task 1171 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_unpack)
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Started
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Started
NOTE: recipe libxcb-1.14-r0: task do_unpack: Started
NOTE: Running task 1172 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_patch: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_unpack: Succeeded
NOTE: Running task 1173 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_patch)
NOTE: recipe nettle-3.7.3-r0: task do_unpack: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_unpack: Started
NOTE: Running task 1174 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_fetch: Started
NOTE: recipe wayland-1.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 1175 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_patch)
NOTE: Running task 1176 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_patch)
NOTE: Running task 1177 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_patch)
NOTE: recipe file-5.41-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_unpack: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_unpack: Started
NOTE: recipe bzip2-1.0.8-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_fetch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1178 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_patch)
NOTE: recipe xtrans-1_1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_fetch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Started
NOTE: Running task 1179 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch)
NOTE: recipe dbus-1.14.0-r0: task do_fetch: Succeeded
NOTE: Running task 1180 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_patch)
NOTE: recipe openssl-3.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1181 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_patch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_unpack: Started
NOTE: Running task 1182 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_patch)
NOTE: recipe gnutls-3.7.4-r0: task do_unpack: Started
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_unpack: Started
NOTE: Running task 1183 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1189 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.11.1.bb:do_populate_sysroot)
NOTE: recipe sqlite3-3_3.38.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-29-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_unpack: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_unpack: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_unpack: Succeeded
NOTE: Running task 1190 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_patch: Started
NOTE: Running task 1191 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_patch)
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1192 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_patch)
NOTE: Running task 1193 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_patch)
NOTE: Running task 1194 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_patch)
NOTE: Running task 1195 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_patch)
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libffi-3.4.2-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_unpack: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1196 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1197 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_patch)
NOTE: recipe expat-2.4.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_unpack: Started
NOTE: recipe wayland-1.20.0-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_patch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Started
NOTE: Running task 1199 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot)
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre-8.45-r0: task do_unpack: Succeeded
NOTE: Running task 1200 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_generate_toolchain_file)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_patch: Started
NOTE: Running task 1201 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_patch)
NOTE: Running task 1202 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 1203 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_patch)
NOTE: recipe readline-8.1.2-r0: task do_patch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_unpack: Succeeded
NOTE: recipe file-5.41-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot: Started
NOTE: Running task 1204 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_patch)
NOTE: Running task 1205 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1206 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_patch)
NOTE: Running task 1207 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_patch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_patch: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_patch: Succeeded
NOTE: Running task 1208 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_patch)
NOTE: Running task 1209 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_patch)
NOTE: Running task 1210 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2021.5-r0: task do_patch: Started
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Started
NOTE: Running task 1211 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_unpack: Succeeded
NOTE: recipe kmod-29-r0: task do_unpack: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.44-r0: task do_unpack: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1212 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_patch)
NOTE: recipe libxcb-1.14-r0: task do_patch: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1213 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_patch)
NOTE: recipe libseccomp-2.5.3-r0: task do_patch: Succeeded
NOTE: Running task 1214 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_patch)
NOTE: Running task 1215 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libarchive-3.6.0-r0: task do_unpack: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Started
NOTE: Running task 1216 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_deploy_source_date_epoch)
NOTE: recipe nettle-3.7.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1219 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_unpack)
NOTE: Running task 1220 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_patch)
NOTE: recipe lzo-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_patch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Started
NOTE: Running task 1221 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_unpack)
NOTE: recipe expat-2.4.7-r0: task do_generate_toolchain_file: Started
NOTE: recipe libunistring-1.0-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1222 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_configure)
NOTE: recipe zstd-1.5.2-r0: task do_patch: Started
NOTE: Running task 1223 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_unpack)
NOTE: Running task 1226 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_prepare_recipe_sysroot)
NOTE: recipe libtirpc-1.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.41-r0: task do_patch: Started
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Started
NOTE: Running task 1227 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe util-linux-2.37.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_patch: Succeeded
NOTE: Running task 1228 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_configure)
NOTE: recipe libnsl2-2.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_patch: Started
NOTE: Running task 1229 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1239 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_write_config)
NOTE: recipe libpthread-stubs-0.4-r0: task do_patch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_patch: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_patch: Succeeded
NOTE: Running task 1240 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_configure)
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe curl-7.82.0-r0: task do_unpack: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1241 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.2-r0: task do_patch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1242 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1243 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1244 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_patch)
NOTE: Running task 1245 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1250 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_write_config)
NOTE: Running task 1251 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Started
NOTE: Running task 1252 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_deploy_source_date_epoch)
NOTE: recipe kmod-29-r0: task do_patch: Started
NOTE: recipe libgpg-error-1.44-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_patch: Started
NOTE: recipe wayland-1.20.0-r0: task do_patch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_patch: Succeeded
NOTE: Running task 1278 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_warn_musl)
NOTE: Running task 1279 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_write_config)
NOTE: recipe libice-1_1.0.10-r0: task do_patch: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Started
NOTE: recipe elfutils-0.186-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1280 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure)
NOTE: recipe libxcb-1.14-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_patch: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_configure: Started
NOTE: Running task 1281 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_deploy_source_date_epoch)
NOTE: Running task 1282 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1283 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_patch)
NOTE: Running task 1284 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_patch: Succeeded
NOTE: recipe file-5.41-r0: task do_patch: Succeeded
NOTE: Running task 1285 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 1286 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1287 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.4.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1288 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.75.bb:do_deploy_source_date_epoch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_patch: Succeeded
NOTE: Running task 1291 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.41.bb:do_deploy_source_date_epoch)
NOTE: Running task 1300 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_fetch)
NOTE: recipe libgpg-error-1.44-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.14.0-r0: task do_unpack: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lzo-2.10-r0: task do_patch: Succeeded
NOTE: Running task 1301 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_write_config: Started
NOTE: Running task 1302 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch)
NOTE: recipe xz-5.2.5-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1303 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1309 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_fetch)
NOTE: Running task 1310 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1311 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_write_config: Started
NOTE: Running task 1312 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_configure)
NOTE: recipe curl-7.82.0-r0: task do_patch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lua-5.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1313 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_patch)
NOTE: recipe libarchive-3.6.0-r0: task do_patch: Succeeded
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.4.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1314 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libx11-1_1.7.3.1-r0: task do_patch: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxml2-2.9.13-r0: task do_unpack: Succeeded
NOTE: Running task 1315 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_configure)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_write_config: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Started
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1324 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_configure)
NOTE: recipe systemd-1_250.4-r0: task do_write_config: Started
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Started
NOTE: recipe libxkbcommon-1.4.0-r0: task do_write_config: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_patch: Succeeded
NOTE: Running task 1325 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_patch)
NOTE: Running task 1326 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_patch)
NOTE: Running task 1327 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_configure)
NOTE: recipe systemd-1_250.4-r0: task do_warn_musl: Started
NOTE: Running task 1328 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe popt-1.18-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_unpack: Succeeded
NOTE: recipe kmod-29-r0: task do_patch: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_warn_musl: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1329 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1330 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_unpack)
NOTE: Running task 1337 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_prepare_recipe_sysroot)
NOTE: recipe nettle-3.7.3-r0: task do_patch: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1338 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_patch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Started
NOTE: Running task 1339 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1340 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_deploy_source_date_epoch)
NOTE: recipe libseccomp-2.5.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_configure: Started
NOTE: Running task 1368 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_configure)
NOTE: recipe openssl-3.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1381 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe shadow-4.11.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_write_config: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_patch: Started
NOTE: Running task 1382 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_configure)
NOTE: recipe libarchive-3.6.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.7-r0: task do_configure: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Started
NOTE: recipe libunistring-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1460 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_configure: Started
NOTE: recipe libgpg-error-1.44-r0: task do_patch: Succeeded
NOTE: recipe rpm-1_4.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.9.4-r0: task do_patch: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_patch: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_fetch: Started
NOTE: recipe dbus-1.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1461 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_configure)
NOTE: recipe libxml2-2.9.13-r0: task do_patch: Started
NOTE: Running task 1462 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_patch)
NOTE: Running task 1463 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-7.82.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1464 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1465 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_unpack)
NOTE: recipe popt-1.18-r0: task do_unpack: Started
NOTE: recipe libidn2-2.3.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_fetch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_patch: Started
NOTE: recipe lua-5.4.4-r0: task do_patch: Succeeded
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1466 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_configure)
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1467 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_configure)
NOTE: recipe shadow-sysroot-4.6-r3: task do_configure: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_configure: Started
NOTE: recipe xorgproto-2021.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe wayland-1.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe popt-1.18-r0: task do_unpack: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxkbcommon-1.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libmicrohttpd-0.9.75-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1468 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1469 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_unpack)
NOTE: Running task 1470 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_patch)
NOTE: recipe file-5.41-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1471 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_compile)
NOTE: Running task 1472 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_configure)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.4-r0: task do_unpack: Succeeded
NOTE: recipe lzo-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: Running task 1473 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_patch)
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libarchive-3.6.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1474 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_configure)
NOTE: recipe nettle-3.7.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1475 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_configure)
NOTE: recipe kmod-29-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe curl-7.82.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_unpack: Succeeded
NOTE: recipe kmod-29-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcrypt-1.9.4-r0: task do_patch: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_patch: Succeeded
NOTE: Running task 1476 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.13.bb:do_deploy_source_date_epoch)
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_patch: Succeeded
NOTE: Running task 1477 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_configure)
NOTE: Running task 1478 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.72.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1479 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_configure)
NOTE: Running task 1480 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_patch)
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Started
NOTE: Running task 1481 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1482 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_29.bb:do_configure)
NOTE: recipe elfutils-0.186-r0: task do_unpack: Succeeded
NOTE: Running task 1483 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_patch)
NOTE: Running task 1484 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: Running task 1485 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libunistring-1.0-r0: task do_configure: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.44-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe zstd-1.5.2-r0: task do_configure: Started
NOTE: recipe dbus-1.14.0-r0: task do_patch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Started
NOTE: recipe python3-3.10.3-r0: task do_unpack: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Started
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_unpack: Started
NOTE: recipe popt-1.18-r0: task do_patch: Started
NOTE: Running task 1486 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_patch)
NOTE: recipe xorgproto-2021.5-r0: task do_configure: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_compile: Succeeded
NOTE: recipe gnutls-3.7.4-r0: task do_patch: Started
NOTE: recipe nettle-3.7.3-r0: task do_configure: Started
NOTE: Running task 1487 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_install)
NOTE: recipe zstd-1.5.2-r0: task do_configure: Succeeded
NOTE: recipe popt-1.18-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_configure: Started
NOTE: recipe lzo-2.10-r0: task do_configure: Started
NOTE: Running task 1488 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_deploy_source_date_epoch)
NOTE: Running task 1489 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.2.bb:do_compile)
NOTE: recipe libgcrypt-1.9.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Started
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dbus-1.14.0-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.186-r0: task do_patch: Started
NOTE: recipe kmod-29-r0: task do_configure: Started
NOTE: Running task 1490 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-1_250.4-r0: task do_patch: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_unpack: Succeeded
NOTE: Running task 1491 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_patch)
NOTE: recipe zstd-1.5.2-r0: task do_compile: Started
NOTE: recipe gnutls-3.7.4-r0: task do_patch: Succeeded
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.44-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Started
NOTE: recipe libx11-1_1.7.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1492 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.7.4.bb:do_deploy_source_date_epoch)
NOTE: recipe lua-5.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1493 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_configure)
NOTE: recipe python3-3.10.3-r0: task do_patch: Started
NOTE: recipe dbus-1.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_patch: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.72.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxml2-2.9.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnutls-3.7.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.44-r0: task do_configure: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_unpack: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_install: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: Running task 1494 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_patch)
NOTE: Running task 1495 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_patch)
NOTE: recipe popt-1.18-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1496 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot)
NOTE: Running task 1497 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_configure)
NOTE: recipe createrepo-c-0.20.0-r0: task do_patch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_patch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Started
NOTE: Running task 1498 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1499 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_generate_toolchain_file)
NOTE: Running task 1500 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_populate_lic)
NOTE: recipe popt-1.18-r0: task do_configure: Started
NOTE: recipe dbus-1.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_populate_lic: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe gnutls-3.7.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe createrepo-c-0.20.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe createrepo-c-0.20.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/createrepo-c/createrepo-c_0.20.0.bb:do_populate_lic unihash changed to 47b2b04b562dfc64a7348e486d04f0c60a53c5f0410422a36585aa109212c49f
NOTE: recipe systemd-1_250.4-r0: task do_patch: Succeeded
NOTE: Running task 1501 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_250.4.bb:do_deploy_source_date_epoch)
NOTE: recipe createrepo-c-0.20.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-1_250.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe expat-2.4.7-r0: task do_configure: Succeeded
NOTE: Running task 1502 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_configure_ptest_base)
NOTE: recipe expat-2.4.7-r0: task do_configure_ptest_base: Started
NOTE: recipe systemd-1_250.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1503 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_compile)
NOTE: recipe expat-2.4.7-r0: task do_compile: Started
NOTE: recipe elfutils-0.186-r0: task do_patch: Succeeded
NOTE: Running task 1504 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.186.bb:do_deploy_source_date_epoch)
NOTE: recipe xorgproto-2021.5-r0: task do_configure: Succeeded
NOTE: Running task 1505 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_compile)
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2021.5-r0: task do_compile: Started
NOTE: recipe xorgproto-2021.5-r0: task do_compile: Succeeded
NOTE: Running task 1506 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_install)
NOTE: recipe elfutils-0.186-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_install: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_configure: Succeeded
NOTE: Running task 1507 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_compile)
NOTE: recipe rpm-1_4.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1508 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rpm/rpm_4.17.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.10.3-r0: task do_patch: Succeeded
NOTE: Running task 1509 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.10.3.bb:do_deploy_source_date_epoch)
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_compile: Succeeded
NOTE: Running task 1510 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_patch: Succeeded
NOTE: Running task 1511 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch)
NOTE: recipe python3-3.10.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Started
NOTE: recipe rpm-1_4.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_install: Succeeded
NOTE: Running task 1512 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_populate_sysroot)
NOTE: Running task 1513 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_package)
NOTE: recipe python3-3.10.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_configure: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot: Started
NOTE: Running task 1514 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_compile)
NOTE: recipe util-macros-1_1.19.3-r0: task do_install: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_package: Started
NOTE: Running task 1515 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot)
NOTE: Running task 1516 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package)
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1517 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_configure)
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_configure: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_compile: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Started
NOTE: Running task 1518 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_install)
NOTE: recipe unzip-1_6.0-r5: task do_configure: Succeeded
NOTE: Running task 1519 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_compile)
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_compile: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1520 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1521 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1522 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1523 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_configure: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1524 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_compile)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_compile: Succeeded
NOTE: Running task 1525 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_install)
NOTE: recipe xtrans-1_1.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1526 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1527 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_configure)
NOTE: recipe xcb-proto-1.14.1-r0: task do_install: Succeeded
NOTE: Running task 1528 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_configure)
NOTE: Running task 1529 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot)
NOTE: Running task 1530 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package)
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Started
NOTE: Running task 1531 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_configure)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_install: Succeeded
NOTE: Running task 1532 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot)
NOTE: Running task 1533 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Started
NOTE: recipe xorgproto-2021.5-r0: task do_package: Succeeded
NOTE: Running task 1534 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2021.5.bb:do_packagedata)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package: Succeeded
NOTE: Running task 1535 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Started
NOTE: recipe xorgproto-2021.5-r0: task do_packagedata: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package: Succeeded
NOTE: Running task 1536 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata)
NOTE: recipe nettle-3.7.3-r0: task do_configure: Succeeded
NOTE: Running task 1537 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_configure_ptest_base)
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Started
NOTE: recipe nettle-3.7.3-r0: task do_configure_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_configure: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1538 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_configure_ptest_base)
NOTE: Running task 1539 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.7.3.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Started
NOTE: recipe nettle-3.7.3-r0: task do_compile: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1540 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_configure: Succeeded
NOTE: Running task 1541 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_compile)
NOTE: recipe libpthread-stubs-0.4-r0: task do_package: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Started
NOTE: Running task 1542 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata: Succeeded
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_compile: Succeeded
NOTE: Running task 1543 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_install)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Started
NOTE: recipe sqlite3-3_3.38.2-r0: task do_configure: Succeeded
NOTE: Running task 1544 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.38.2.bb:do_compile)
NOTE: recipe sqlite3-3_3.38.2-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile: Succeeded
NOTE: Running task 1545 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_compile_ptest_base)
NOTE: recipe readline-8.1.2-r0: task do_configure: Succeeded
NOTE: Running task 1546 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_compile)
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_compile: Started
NOTE: Running task 1547 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_install: Succeeded
NOTE: Running task 1548 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_populate_sysroot)
NOTE: Running task 1549 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.35.1.bb:do_package)
NOTE: recipe bzip2-1.0.8-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Started
NOTE: recipe expat-2.4.7-r0: task do_compile: Succeeded
NOTE: Running task 1550 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_compile_ptest_base)
NOTE: recipe libtirpc-1.3.2-r0: task do_configure: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_compile_ptest_base: Started
NOTE: Running task 1551 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_compile)
NOTE: recipe expat-2.4.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1552 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_install)
NOTE: recipe libtirpc-1.3.2-r0: task do_compile: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install: Succeeded
NOTE: Running task 1553 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_install_ptest_base)
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Started
NOTE: recipe expat-2.4.7-r0: task do_install: Succeeded
NOTE: Running task 1554 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_install_ptest_base)
NOTE: recipe bzip2-1.0.8-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1555 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot)
NOTE: Running task 1556 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package)
NOTE: recipe expat-2.4.7-r0: task do_install_ptest_base: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package: Started
NOTE: recipe expat-2.4.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1557 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_populate_sysroot)
NOTE: Running task 1558 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_package)
NOTE: recipe libtirpc-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 1559 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_install)
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot: Started
NOTE: recipe readline-8.1.2-r0: task do_compile: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_package: Started
NOTE: Running task 1560 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_install)
NOTE: recipe libtirpc-1.3.2-r0: task do_install: Started
NOTE: recipe readline-8.1.2-r0: task do_install: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1561 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expat-2.4.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_configure: Succeeded
NOTE: Running task 1562 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_configure_ptest_base)
NOTE: recipe libtirpc-1.3.2-r0: task do_install: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_configure_ptest_base: Started
NOTE: Running task 1563 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_populate_sysroot)
NOTE: Running task 1564 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.2.bb:do_package)
NOTE: recipe libpcre-8.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1565 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.45.bb:do_configure)
NOTE: Running task 1566 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.3.bb:do_compile)
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe libtirpc-1.3.2-r0: task do_package: Started
NOTE: recipe libseccomp-2.5.3-r0: task do_compile: Started
NOTE: recipe libpcre-8.45-r0: task do_configure: Started
NOTE: recipe readline-8.1.2-r0: task do_install: Succeeded
NOTE: Running task 1567 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_populate_sysroot)
NOTE: Running task 1568 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.2.bb:do_package)
NOTE: recipe libtirpc-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot: Started
NOTE: Running task 1569 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_prepare_recipe_sysroot)
NOTE: recipe readline-8.1.2-r0: task do_package: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_configure: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1570 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_compile)
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_compile: Succeeded
NOTE: Running task 1571 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_install)
NOTE: recipe libnsl2-2.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe popt-1.18-r0: task do_configure: Succeeded
NOTE: Running task 1572 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_configure)
NOTE: Running task 1573 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.18.bb:do_compile)
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_configure: Started
NOTE: recipe popt-1.18-r0: task do_compile: Started
NOTE: recipe readline-8.1.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1574 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe xtrans-1_1.4.0-r0: task do_install: Succeeded
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1575 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot)
NOTE: Running task 1576 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package)
NOTE: recipe expat-2.4.7-r0: task do_package: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Started
NOTE: Running task 1577 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata)
NOTE: recipe lua-5.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1578 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure)
NOTE: recipe expat-2.4.7-r0: task do_packagedata: Started
NOTE: recipe lua-5.4.4-r0: task do_configure: Started
NOTE: recipe libffi-3.4.2-r0: task do_configure: Succeeded
NOTE: Running task 1579 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.2.bb:do_compile)
NOTE: recipe lua-5.4.4-r0: task do_configure: Succeeded
NOTE: Running task 1580 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/lua/lua_5.4.4.bb:do_configure_ptest_base)
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_compile: Started
NOTE: Running task 1581 of 1851 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Started
NOTE: recipe lua-5.4.4-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe expat-2.4.7-r0: task do_packagedata: Failed
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.35.1-r0: task do_package: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_package: Succeeded
NOTE: recipe libtirpc-1.3.2-r0: task do_package: Succeeded
NOTE: recipe popt-1.18-r0: task do_compile: Succeeded
NOTE: recipe readline-8.1.2-r0: task do_package: Succeeded
NOTE: recipe libffi-3.4.2-r0: task do_compile: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_configure: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_package: Succeeded
NOTE: recipe kmod-29-r0: task do_configure: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_configure: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_configure: Succeeded
NOTE: recipe libseccomp-2.5.3-r0: task do_compile: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_compile: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_configure: Succeeded
NOTE: recipe nettle-3.7.3-r0: task do_compile: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_configure: Succeeded
NOTE: recipe lzo-2.10-r0: task do_configure: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_configure: Succeeded
NOTE: recipe zstd-1.5.2-r0: task do_compile: Succeeded
NOTE: recipe libpcre-8.45-r0: task do_configure: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_configure: Succeeded
NOTE: recipe sqlite3-3_3.38.2-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1581 tasks of which 1243 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata
Summary: There were 10 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-src went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-dbg went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-ptest went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-staticdev went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-dev went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-doc went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-locale went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat-bin went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: QA Issue: Package version for package expat went backwards which would break package feeds (from 0:2.4.8-r0 to 0:2.4.7-r0) [version-going-backwards]
ERROR: expat-2.4.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/expat/2.4.7-r0/temp/log.do_packagedata.2312223
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.4.7.bb:do_packagedata) failed with exit code '1'

--===============8990413631242575061==--

