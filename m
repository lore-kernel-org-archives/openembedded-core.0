Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD90EC25B7C
	for <webhook@archiver.kernel.org>; Tue, 15 Aug 2023 07:54:09 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.129509.1692086041609377134
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Aug 2023 00:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=AaqawpcZ;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=D1s0mnbm;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010189f82ff8cd-8944250f-1e8a-4772-9c0c-4c5f26142229-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1692086041;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CYOUu8i4MVehVOaP9bYtVGl7hdDAjnkbgm2bBptqi8s=;
	b=AaqawpcZ6DkTCmENASYNCCjyKzDyDt/DvXy5kI+IcnYMiqnAzkqKNCSGpMiao2Jy
	Ybsi+41OT3PA3j8TDMhe2K4/NgIX2m6YGgXpuADFoHLnmXkSjjItEk+IRWPjlr0FbOj
	Tjf/ITdBrVGKo/InmMvS8ayf0ZbuF441VLCM1+Us=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1692086041;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CYOUu8i4MVehVOaP9bYtVGl7hdDAjnkbgm2bBptqi8s=;
	b=D1s0mnbm1s2/+go/ba+Y9DDFoMMkHsJV+ns4Td8c4syQcn3bZRLsjVkOrnt4OSqU
	vI3mjKBemNSZs/uq1XOIVRxzEz4GFKxN6KYqFws1YRpy8jIZmSu1RLQBNQu+rK3diHt
	Y5RXJr9sJvAcVb8oCQpDt9AxLI9BNladJcpqEjpo=
Content-Type: multipart/mixed; boundary="===============4893195804416606298=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glibc-testsuite: upgrading to 2.38 FAILED
Message-ID: <01010189f82ff8cd-8944250f-1e8a-4772-9c0c-4c5f26142229-000000@us-west-2.amazonses.com>
Date: Tue, 15 Aug 2023 07:54:00 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.08.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Aug 2023 07:54:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185949

--===============4893195804416606298==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glibc-testsuite* to *2.38* has Failed(other errors).

Detailed error information:

'MACHINE=qemux86 bitbake glibc-testsuite' failed
Loading cache...done.
Loaded 1804 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d151ba95f69d7224241fb8c76c90bbe4b2fd9563"

Initialising tasks...done.
Sstate summary: Wanted 99 Local 38 Mirrors 0 Missed 61 Current 226 (38% match, 81% complete)
Removing 9 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 240 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 242 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 655 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_collect_spdx_deps)
NOTE: Running task 656 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_collect_spdx_deps)
NOTE: Running task 686 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl-cross/perlcross_1.4.1.bb:do_collect_spdx_deps)
NOTE: Running task 687 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_collect_spdx_deps)
NOTE: Running task 689 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_collect_spdx_deps)
NOTE: Running task 690 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_collect_spdx_deps)
NOTE: Running task 691 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_collect_spdx_deps)
NOTE: Running task 706 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/re2c/re2c_3.1.bb:do_collect_spdx_deps)
NOTE: Running task 707 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_collect_spdx_deps)
NOTE: Running task 708 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_collect_spdx_deps)
NOTE: Running task 709 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_collect_spdx_deps)
NOTE: Running task 710 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_recipe_qa)
NOTE: Running task 711 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_recipe_qa)
NOTE: Running task 718 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_recipe_qa)
NOTE: Running task 729 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_recipe_qa)
NOTE: Running task 730 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-build_0.10.0.bb:do_recipe_qa)
NOTE: Running task 735 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/cross-localedef-native_2.37.bb:do_recipe_qa)
NOTE: Running task 736 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.41.0.bb:do_recipe_qa)
NOTE: Running task 737 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_recipe_qa)
NOTE: Running task 738 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.1.1.bb:do_recipe_qa)
NOTE: Running task 739 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-testsuite_2.37.bb:do_recipe_qa)
NOTE: Running task 740 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.1.bb:do_recipe_qa)
NOTE: Running task 741 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_collect_spdx_deps)
NOTE: Running task 742 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_recipe_qa)
NOTE: Running task 743 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_deploy_source_date_epoch)
NOTE: Running task 744 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.0.3.bb:do_recipe_qa)
NOTE: Running task 745 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa)
NOTE: Running task 746 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_collect_spdx_deps)
NOTE: Running task 747 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_collect_spdx_deps)
NOTE: recipe cross-localedef-native-2.37-r0: task do_recipe_qa: Started
NOTE: recipe perlcross-native-1.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-locale-2.37-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe make-native-4.4.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtirpc-native-1.3.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe ncurses-native-6.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe unzip-native-1_6.0-r5: task do_recipe_qa: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa: Started
NOTE: recipe perlcross-native-1.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xz-native-5.4.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_recipe_qa: Started
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe bzip2-native-1.0.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_recipe_qa: Started
NOTE: Running task 748 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl-cross/perlcross_1.4.1.bb:do_create_spdx)
NOTE: recipe sqlite3-native-3_3.42.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdbm-native-1.23-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-build-native-0.10.0-r0: task do_recipe_qa: Started
NOTE: recipe python3-wheel-native-0.41.0-r0: task do_recipe_qa: Started
NOTE: recipe libffi-native-3.4.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-setuptools-native-68.0.0-r0: task do_recipe_qa: Started
NOTE: recipe make-native-4.4.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glibc-testsuite-2.37-r1: task do_recipe_qa: Started
NOTE: recipe libtirpc-native-1.3.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ncurses-native-6.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xz-native-5.4.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bzip2-native-1.0.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpcre2-native-10.42-r0: task do_collect_spdx_deps: Started
NOTE: Running task 749 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx)
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 750 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx)
NOTE: recipe meson-native-1.1.1-r0: task do_recipe_qa: Started
NOTE: recipe gettext-native-0.21.1-r0: task do_recipe_qa: Started
NOTE: recipe sqlite3-native-3_3.42.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 751 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_create_spdx)
NOTE: Running task 752 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_create_spdx)
NOTE: Running task 753 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx)
NOTE: Running task 754 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_create_spdx)
NOTE: recipe gdbm-native-1.23-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libffi-native-3.4.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 755 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_create_spdx)
NOTE: Running task 756 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_create_spdx)
NOTE: recipe re2c-native-3.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe qemu-native-8.0.3-r0: task do_recipe_qa: Started
NOTE: recipe libpcre2-native-10.42-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 757 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_create_spdx)
NOTE: Running task 758 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx)
NOTE: recipe re2c-native-3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 759 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/re2c/re2c_3.1.bb:do_create_spdx)
NOTE: recipe cross-localedef-native-2.37-r0: task do_recipe_qa: Succeeded
NOTE: Running task 760 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/cross-localedef-native_2.37.bb:do_fetch)
NOTE: recipe unzip-native-1_6.0-r5: task do_recipe_qa: Succeeded
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa: Succeeded
NOTE: Running task 761 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe perlcross-native-1.4.1-r0: task do_create_spdx: Started
NOTE: Running task 762 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_fetch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 763 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_fetch)
NOTE: recipe python3-setuptools-native-68.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 290 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 291 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_create_spdx_setscene)
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-wheel-native-0.41.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 764 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_fetch)
NOTE: Running task 765 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_fetch)
NOTE: Running task 766 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_fetch)
NOTE: recipe python3-build-native-0.10.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 767 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.41.0.bb:do_fetch)
NOTE: Running task 768 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_create_spdx)
NOTE: recipe glib-2.0-native-1_2.76.4-r0: task do_recipe_qa: Started
NOTE: recipe gettext-native-0.21.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glibc-testsuite-2.37-r1: task do_recipe_qa: Succeeded
NOTE: Running task 769 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-build_0.10.0.bb:do_fetch)
NOTE: Running task 770 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.1.bb:do_fetch)
NOTE: Running task 771 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb:do_create_spdx)
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx: Started
NOTE: recipe xz-native-5.4.3-r0: task do_create_spdx: Started
NOTE: Running task 772 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-testsuite_2.37.bb:do_fetch)
NOTE: recipe libtirpc-native-1.3.3-r0: task do_create_spdx: Started
NOTE: recipe meson-native-1.1.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe sqlite3-native-3_3.42.0-r0: task do_create_spdx: Started
NOTE: Running task 773 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.1.1.bb:do_fetch)
NOTE: recipe qemu-native-8.0.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx: Started
NOTE: recipe libpcre2-native-10.42-r0: task do_create_spdx: Started
NOTE: recipe glibc-locale-2.37-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 774 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.0.3.bb:do_fetch)
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_create_spdx: Started
NOTE: recipe re2c-native-3.1-r0: task do_create_spdx: Started
NOTE: recipe ncurses-native-6.4-r0: task do_create_spdx: Started
NOTE: recipe cross-localedef-native-2.37-r0: task do_fetch: Started
NOTE: recipe gdbm-native-1.23-r0: task do_create_spdx: Started
NOTE: recipe libffi-native-3.4.4-r0: task do_create_spdx: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Started
NOTE: recipe unzip-native-1_6.0-r5: task do_fetch: Started
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-native-1_2.76.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe python3-setuptools-native-68.0.0-r0: task do_fetch: Started
NOTE: Running task 775 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_fetch)
NOTE: recipe qemu-native-8.0.3-r0: task do_fetch: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_fetch: Succeeded
NOTE: recipe glibc-testsuite-2.37-r1: task do_fetch: Started
NOTE: Running task 776 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_unpack)
NOTE: recipe python3-build-native-0.10.0-r0: task do_fetch: Started
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_create_spdx: Started
NOTE: recipe gettext-native-0.21.1-r0: task do_fetch: Started
NOTE: recipe python3-wheel-native-0.41.0-r0: task do_fetch: Started
NOTE: recipe meson-native-1.1.1-r0: task do_fetch: Started
NOTE: recipe perlcross-native-1.4.1-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-native-3_3.42.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gettext-native-0.21.1-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 777 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.1.bb:do_unpack)
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_fetch: Started
NOTE: recipe xz-native-5.4.3-r0: task do_create_spdx: Succeeded
NOTE: Running setscene task 292 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_create_spdx_setscene)
NOTE: recipe bzip2-native-1.0.8-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-libuuid-native-2.39.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_create_spdx: Started
NOTE: recipe re2c-native-3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe make-native-4.4.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libpcre2-native-10.42-r0: task do_create_spdx: Succeeded
NOTE: recipe libtirpc-native-1.3.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Started
NOTE: Running task 778 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_collect_spdx_deps)
NOTE: Running task 779 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_collect_spdx_deps)
NOTE: recipe ncurses-native-6.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 780 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_collect_spdx_deps)
NOTE: recipe libffi-native-3.4.4-r0: task do_create_spdx: Succeeded
NOTE: recipe gdbm-native-1.23-r0: task do_create_spdx: Succeeded
NOTE: recipe python3-build-native-0.10.0-r0: task do_fetch: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 781 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-build_0.10.0.bb:do_unpack)
NOTE: Running task 782 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_unpack)
NOTE: Running task 783 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_collect_spdx_deps)
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_fetch: Succeeded
NOTE: Running task 784 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_unpack)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 295 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 296 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 297 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_fetch: Succeeded
NOTE: recipe glibc-2.37-r1: task do_create_spdx_setscene: Started
NOTE: Running task 785 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_unpack)
NOTE: recipe gettext-native-0.21.1-r0: task do_unpack: Started
NOTE: recipe python3-setuptools-native-68.0.0-r0: task do_fetch: Succeeded
NOTE: recipe ninja-native-1.11.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 786 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_unpack)
NOTE: recipe python3-wheel-native-0.41.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.76.4-r0: task do_fetch: Started
NOTE: Running task 787 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.41.0.bb:do_unpack)
NOTE: recipe libnsl2-native-2.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe ninja-native-1.11.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 788 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_create_spdx)
NOTE: recipe gtk-doc-native-1.33.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libnsl2-native-2.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 789 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx)
NOTE: recipe libedit-native-20221030-3.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-ng-native-0.8.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 790 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_collect_spdx_deps)
NOTE: recipe libedit-native-20221030-3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_unpack: Succeeded
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_unpack: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_unpack: Started
NOTE: recipe python3-build-native-0.10.0-r0: task do_unpack: Started
NOTE: Running task 791 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_create_spdx)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_create_spdx_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 299 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-build-native-0.10.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_unpack: Succeeded
NOTE: recipe python3-installer-native-0.7.0-r0: task do_unpack: Started
NOTE: recipe perl-native-5.36.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-setuptools-native-68.0.0-r0: task do_unpack: Started
NOTE: recipe python3-wheel-native-0.41.0-r0: task do_unpack: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_unpack: Succeeded
NOTE: recipe perl-native-5.36.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 792 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_create_spdx)
NOTE: recipe ninja-native-1.11.1-r0: task do_create_spdx: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-wheel-native-0.41.0-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-native-2.0.0-r0: task do_create_spdx: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 301 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_packagedata_setscene)
NOTE: recipe libedit-native-20221030-3.1-r0: task do_create_spdx: Started
NOTE: recipe util-linux-native-2.39.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 302 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 304 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-native-68.0.0-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-native-2.39.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 795 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_create_spdx)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 305 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 306 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_create_spdx_setscene)
NOTE: recipe perl-native-5.36.1-r0: task do_create_spdx: Started
NOTE: recipe ninja-native-1.11.1-r0: task do_create_spdx: Succeeded
NOTE: recipe glibc-2.37-r1: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-native-2.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-native-20221030-3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe util-linux-native-2.39.1-r0: task do_create_spdx: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe perl-native-5.36.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 798 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_collect_spdx_deps)
NOTE: recipe glibc-2.37-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 307 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_package_setscene)
NOTE: recipe util-linux-native-2.39.1-r0: task do_create_spdx: Succeeded
NOTE: recipe glibc-2.37-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-native-3.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe meson-native-1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe openssl-native-3.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 799 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_create_spdx)
NOTE: Running task 800 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.1.1.bb:do_unpack)
NOTE: recipe openssl-native-3.1.1-r0: task do_create_spdx: Started
NOTE: recipe meson-native-1.1.1-r0: task do_unpack: Started
NOTE: recipe gettext-native-0.21.1-r0: task do_unpack: Succeeded
NOTE: Running task 801 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.1.bb:do_collect_spdx_deps)
NOTE: recipe openssl-native-3.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 802 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.26.4.bb:do_collect_spdx_deps)
NOTE: recipe gettext-native-0.21.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe cmake-native-3.26.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gettext-native-0.21.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 803 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.1.bb:do_create_spdx)
NOTE: recipe cmake-native-3.26.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 804 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/cmake/cmake-native_3.26.4.bb:do_create_spdx)
NOTE: recipe meson-native-1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe cmake-native-3.26.4-r0: task do_create_spdx: Started
NOTE: recipe glibc-2.37-r1: task do_package_setscene: Started
NOTE: recipe gettext-native-0.21.1-r0: task do_create_spdx: Started
NOTE: recipe cmake-native-3.26.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 805 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_collect_spdx_deps)
NOTE: recipe gettext-native-0.21.1-r0: task do_create_spdx: Succeeded
NOTE: recipe expat-native-2.5.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe expat-native-2.5.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 806 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx)
NOTE: recipe expat-native-2.5.0-r0: task do_create_spdx: Started
NOTE: recipe expat-native-2.5.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 807 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-native-1_2.76.4-r0: task do_fetch: Succeeded
NOTE: Running task 808 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_unpack)
NOTE: recipe python3-native-3.11.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-native-3.11.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 809 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx)
NOTE: recipe glib-2.0-native-1_2.76.4-r0: task do_unpack: Started
NOTE: recipe python3-native-3.11.4-r0: task do_create_spdx: Started
NOTE: recipe python3-native-3.11.4-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-native-1_2.76.4-r0: task do_unpack: Succeeded
NOTE: recipe glibc-testsuite-2.37-r1: task do_fetch: Succeeded
NOTE: Running task 810 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-testsuite_2.37.bb:do_unpack)
NOTE: recipe glibc-testsuite-2.37-r1: task do_unpack: Started
NOTE: recipe glibc-2.37-r1: task do_package_setscene: Succeeded
NOTE: Running setscene task 308 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_stash_locale_setscene)
NOTE: Running setscene task 309 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe cross-localedef-native-2.37-r0: task do_fetch: Succeeded
NOTE: Running task 811 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/cross-localedef-native_2.37.bb:do_unpack)
NOTE: Running task 812 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/cross-localedef-native_2.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe cross-localedef-native-2.37-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cross-localedef-native-2.37-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_stash_locale_setscene: Started
NOTE: recipe cross-localedef-native-2.37-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 310 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_package_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_package_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 311 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 313 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 316 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_recipe_qa_setscene)
NOTE: recipe glibc-2.37-r1: task do_recipe_qa_setscene: Started
NOTE: recipe glibc-2.37-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_package_setscene: Succeeded
NOTE: recipe qemu-native-8.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 820 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.0.3.bb:do_unpack)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe qemu-native-8.0.3-r0: task do_unpack: Started
NOTE: Running setscene task 319 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 320 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 321 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 322 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 323 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 325 of 325 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: Running task 845 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_package_write_rpm)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 906 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_collect_spdx_deps)
NOTE: Running task 907 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_package_write_rpm)
NOTE: recipe glibc-testsuite-2.37-r1: task do_unpack: Succeeded
NOTE: Running task 908 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-testsuite_2.37.bb:do_patch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe glibc-testsuite-2.37-r1: task do_patch: Started
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 909 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx: Succeeded
NOTE: recipe glibc-testsuite-2.37-r1: task do_patch: Succeeded
NOTE: Running task 910 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-testsuite_2.37.bb:do_populate_lic)
NOTE: recipe unzip-native-1_6.0-r5: task do_fetch: Succeeded
NOTE: Running task 911 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe glibc-testsuite-2.37-r1: task do_populate_lic: Started
NOTE: recipe unzip-native-1_6.0-r5: task do_unpack: Started
NOTE: recipe glibc-testsuite-2.37-r1: task do_populate_lic: Succeeded
NOTE: recipe unzip-native-1_6.0-r5: task do_unpack: Succeeded
NOTE: Running task 912 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_collect_spdx_deps)
NOTE: recipe unzip-native-1_6.0-r5: task do_collect_spdx_deps: Started
NOTE: recipe unzip-native-1_6.0-r5: task do_collect_spdx_deps: Succeeded
NOTE: Running task 913 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx)
NOTE: recipe unzip-native-1_6.0-r5: task do_create_spdx: Started
NOTE: recipe unzip-native-1_6.0-r5: task do_create_spdx: Succeeded
NOTE: Running task 914 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 915 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-flit-core_3.9.0.bb:do_create_spdx)
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_create_spdx: Started
NOTE: recipe python3-flit-core-native-3.9.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 916 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_collect_spdx_deps)
NOTE: recipe cross-localedef-native-2.37-r0: task do_unpack: Succeeded
NOTE: Running task 917 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/cross-localedef-native_2.37.bb:do_patch)
NOTE: Running task 918 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/cross-localedef-native_2.37.bb:do_collect_spdx_deps)
NOTE: recipe cross-localedef-native-2.37-r0: task do_patch: Started
NOTE: recipe cross-localedef-native-2.37-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe cross-localedef-native-2.37-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 919 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/cross-localedef-native_2.37.bb:do_create_spdx)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 920 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-installer_0.7.0.bb:do_create_spdx)
NOTE: recipe cross-localedef-native-2.37-r0: task do_create_spdx: Started
NOTE: recipe python3-installer-native-0.7.0-r0: task do_create_spdx: Started
NOTE: recipe cross-localedef-native-2.37-r0: task do_create_spdx: Succeeded
NOTE: Running task 921 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_collect_spdx_deps)
NOTE: recipe python3-installer-native-0.7.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 922 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_collect_spdx_deps)
NOTE: recipe glibc-locale-2.37-r1: task do_collect_spdx_deps: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe glibc-locale-2.37-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cross-localedef-native-2.37-r0: task do_patch: Succeeded
NOTE: Running task 923 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-pyproject-hooks_1.0.0.bb:do_create_spdx)
NOTE: Running task 924 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/cross-localedef-native_2.37.bb:do_deploy_source_date_epoch)
NOTE: recipe cross-localedef-native-2.37-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_create_spdx: Started
NOTE: recipe cross-localedef-native-2.37-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 925 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/cross-localedef-native_2.37.bb:do_configure)
NOTE: recipe python3-pyproject-hooks-native-1.0.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 926 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-build_0.10.0.bb:do_collect_spdx_deps)
NOTE: recipe cross-localedef-native-2.37-r0: task do_configure: Started
NOTE: recipe python3-build-native-0.10.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-build-native-0.10.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 927 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-build_0.10.0.bb:do_create_spdx)
NOTE: recipe python3-build-native-0.10.0-r0: task do_create_spdx: Started
NOTE: recipe python3-build-native-0.10.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 928 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.41.0.bb:do_collect_spdx_deps)
NOTE: recipe linux-libc-headers-6.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe python3-wheel-native-0.41.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-wheel-native-0.41.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 929 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-wheel_0.41.0.bb:do_create_spdx)
NOTE: recipe python3-wheel-native-0.41.0-r0: task do_create_spdx: Started
NOTE: recipe python3-wheel-native-0.41.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 930 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_collect_spdx_deps)
NOTE: recipe python3-setuptools-native-68.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-setuptools-native-68.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 931 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3-setuptools_68.0.0.bb:do_create_spdx)
NOTE: recipe python3-setuptools-native-68.0.0-r0: task do_create_spdx: Started
NOTE: recipe python3-setuptools-native-68.0.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 932 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe meson-native-1.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe meson-native-1.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 933 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.1.1.bb:do_create_spdx)
NOTE: recipe meson-native-1.1.1-r0: task do_create_spdx: Started
NOTE: recipe meson-native-1.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 934 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-native-1_2.76.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-native-1_2.76.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 935 of 951 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_create_spdx)
NOTE: recipe glib-2.0-native-1_2.76.4-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-native-1_2.76.4-r0: task do_create_spdx: Succeeded
NOTE: recipe qemu-native-8.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 936 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.0.3.bb:do_collect_spdx_deps)
NOTE: recipe qemu-native-8.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe qemu-native-8.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 937 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.0.3.bb:do_create_spdx)
NOTE: recipe qemu-native-8.0.3-r0: task do_create_spdx: Started
NOTE: recipe qemu-native-8.0.3-r0: task do_create_spdx: Succeeded
NOTE: recipe cross-localedef-native-2.37-r0: task do_configure: Succeeded
NOTE: Running task 938 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/cross-localedef-native_2.37.bb:do_compile)
NOTE: recipe cross-localedef-native-2.37-r0: task do_compile: Started
NOTE: recipe cross-localedef-native-2.37-r0: task do_compile: Succeeded
NOTE: Running task 939 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/cross-localedef-native_2.37.bb:do_install)
NOTE: recipe cross-localedef-native-2.37-r0: task do_install: Started
NOTE: recipe cross-localedef-native-2.37-r0: task do_install: Succeeded
NOTE: Running task 940 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/cross-localedef-native_2.37.bb:do_populate_sysroot)
NOTE: recipe cross-localedef-native-2.37-r0: task do_populate_sysroot: Started
NOTE: recipe cross-localedef-native-2.37-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 941 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-locale-2.37-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe glibc-locale-2.37-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running noexec task 942 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_configure)
NOTE: Running noexec task 943 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_compile)
NOTE: Running task 944 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_install)
NOTE: recipe glibc-2.37-r1: task do_package_write_rpm: Succeeded
NOTE: recipe glibc-locale-2.37-r1: task do_install: Started
NOTE: recipe glibc-locale-2.37-r1: task do_install: Succeeded
NOTE: Running task 945 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_package)
NOTE: recipe glibc-locale-2.37-r1: task do_package: Started
NOTE: recipe glibc-locale-2.37-r1: task do_package: Succeeded
NOTE: Running task 946 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_packagedata)
NOTE: recipe glibc-locale-2.37-r1: task do_packagedata: Started
NOTE: recipe glibc-locale-2.37-r1: task do_packagedata: Succeeded
NOTE: Running task 947 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.37.bb:do_create_spdx)
NOTE: recipe glibc-locale-2.37-r1: task do_create_spdx: Started
NOTE: recipe glibc-locale-2.37-r1: task do_create_spdx: Succeeded
NOTE: Running task 948 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-testsuite_2.37.bb:do_collect_spdx_deps)
NOTE: recipe glibc-testsuite-2.37-r1: task do_collect_spdx_deps: Started
NOTE: recipe glibc-testsuite-2.37-r1: task do_collect_spdx_deps: Succeeded
NOTE: Running task 949 of 951 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-testsuite_2.37.bb:do_create_spdx)
NOTE: recipe glibc-testsuite-2.37-r1: task do_create_spdx: Started
NOTE: recipe glibc-testsuite-2.37-r1: task do_create_spdx: Failed
NOTE: Tasks Summary: Attempted 949 tasks of which 813 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-testsuite_2.37.bb:do_create_spdx
Summary: There was 1 ERROR message, returning a non-zero exit code.

ERROR: glibc-testsuite-2.37-r1 do_create_spdx: Recipe glibc-testsuite is trying to create package sln which was already written by recipe glibc. This will cause corruption, please resolve this and only provide the package from one recipe or the other or only build one of the recipes.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/glibc-testsuite/2.37/temp/log.do_create_spdx.2287600
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-testsuite_2.37.bb:do_create_spdx) failed with exit code '1'


Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper
--===============4893195804416606298==--

