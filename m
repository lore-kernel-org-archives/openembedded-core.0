Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD3FC77B7C
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:25 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.30355.1675272854493522198
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=N/yvbEZI;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101860e0b189e-a622fe74-65fc-485e-8e24-9aea5a7d1124-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=GTQaZJ8pd20We3QbtfKaNN3GvFzfhaP9tKWuTh/i91Y=;
	b=N/yvbEZILnmjY8XTm9ukztlhoeHWnYfdvSjMeitrcjggLsyXDpP+NWlyWi+/Nslv
	4++uWrQ3Gk0uP8wwJqcUp3mw16FqhgYo9CPjT7T7YEXD4zLygYsPfr/vqFrt6NvLD/2
	N7sg3h8a0X4VxBBAoPETI3hDQy5Bzqg/zIvQqpcg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272853;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=GTQaZJ8pd20We3QbtfKaNN3GvFzfhaP9tKWuTh/i91Y=;
	b=SWrnRdPABpwQc8CoOLLOEEjS6UMcoZ9NZp43vgrqVjpQKgMNOS6fcRERRnyxfIIP
	I0cgxLAuwEcwc8CVaovdDGQdE/0/8ibsHxKlqZwzPo5DtPKbMK1Ivz0bdSRegrpVK9j
	2mzpcTbByWfggm9vZvdPamAwZWDsn+Z8EMsRNKNI=
Content-Type: multipart/mixed; boundary="===============8936244146043696570=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 252.5 SUCCEEDED
Message-ID: <010101860e0b189e-a622fe74-65fc-485e-8e24-9aea5a7d1124-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:13 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176579

--===============8936244146043696570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *252.5* has Succeeded.

Next steps:
    - apply the patch: git am 0001-systemd-boot-upgrade-252.4-252.5.patch
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
--===============8936244146043696570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 75 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host powerpc-poky-linux (not in COMPATIBLE_HOST)

--===============8936244146043696570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1698 targets, 52 skipped, 0 masked, 0 errors.
Removing 18 recipes from the core2-32 sysroot...done.
Removing 19 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:646c1a5351f98186216e3a2e404e6c69fffbc715"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 96 Local 80 Mirrors 0 Missed 16 Current 162 (83% match, 93% complete)
Removing 2 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 179 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 180 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 181 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_packagedata_setscene)
NOTE: Running setscene task 182 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.66.bb:do_populate_sysroot_setscene)
NOTE: Running task 666 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_fetch)
NOTE: Running task 672 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_fetch)
NOTE: Running task 712 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_fetch)
NOTE: Running task 744 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_write_config)
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_fetch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_fetch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_fetch: Succeeded
NOTE: Running task 745 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_unpack)
NOTE: recipe systemd-boot-252.5-r0: task do_fetch: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_fetch: Succeeded
NOTE: Running task 746 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_unpack)
NOTE: recipe systemd-boot-252.5-r0: task do_write_config: Started
NOTE: recipe libcap-2.66-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-boot-252.5-r0: task do_fetch: Succeeded
NOTE: Running task 747 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_unpack)
NOTE: recipe systemd-boot-252.5-r0: task do_write_config: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_unpack: Started
NOTE: recipe libcap-2.66-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_unpack: Succeeded
NOTE: Running task 752 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_patch)
NOTE: recipe gnu-efi-3.0.15-r0: task do_unpack: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnu-efi-3.0.15-r0: task do_unpack: Succeeded
NOTE: Running task 753 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_patch)
NOTE: recipe systemd-bootconf-1.00-r0: task do_patch: Started
NOTE: recipe systemd-boot-252.5-r0: task do_unpack: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_patch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_patch: Succeeded
NOTE: Running task 754 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-bootconf-1.00-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_patch: Succeeded
NOTE: Running task 755 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-bootconf-1.00-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnu-efi-3.0.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 189 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 190 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 191 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 192 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 194 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 195 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 196 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 197 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 198 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 199 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/ncurses/6.3+20220423-r0/temp/log.do_packagedata_setscene.947829
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 206 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_package_setscene)
NOTE: recipe systemd-boot-252.5-r0: task do_unpack: Succeeded
NOTE: Running task 772 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_patch)
NOTE: recipe systemd-boot-252.5-r0: task do_patch: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 208 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 210 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 211 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.8.bb:do_populate_sysroot_setscene)
NOTE: recipe systemd-boot-252.5-r0: task do_patch: Succeeded
NOTE: Running task 777 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 778 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_populate_lic)
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-boot-252.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-boot-252.5-r0: task do_populate_lic: Started
NOTE: recipe systemd-boot-252.5-r0: task do_populate_lic: Succeeded
NOTE: recipe cracklib-2.9.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_populate_lic unihash changed to 8946bd1a3e958423b39636fe032746f5b20a6e68a3d2510c9f50919fa31ba1d9
NOTE: recipe systemd-boot-252.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_package_setscene: Started
NOTE: recipe cracklib-2.9.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 216 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 217 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 224 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 225 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 227 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 228 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 231 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 233 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 235 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 236 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 239 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 240 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 241 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+f47a8cdd25-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 242 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 243 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 252 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 255 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 256 of 258 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 965 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 986 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata)
NOTE: Running task 991 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnu-efi-3.0.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 992 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_configure)
NOTE: Running task 993 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_configure)
NOTE: recipe systemd-bootconf-1.00-r0: task do_configure: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_configure: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_configure: Succeeded
NOTE: Running task 994 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_compile)
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata: Succeeded
NOTE: recipe gnu-efi-3.0.15-r0: task do_configure: Succeeded
NOTE: Running task 997 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_compile)
NOTE: recipe systemd-bootconf-1.00-r0: task do_compile: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_compile: Succeeded
NOTE: recipe gnu-efi-3.0.15-r0: task do_compile: Started
NOTE: Running task 998 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_install)
NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Succeeded
NOTE: Running task 999 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_package)
NOTE: recipe systemd-bootconf-1.00-r0: task do_package: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_compile: Succeeded
NOTE: Running task 1000 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_install)
NOTE: recipe gnu-efi-3.0.15-r0: task do_install: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_install: Succeeded
NOTE: Running task 1001 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_populate_sysroot)
NOTE: Running task 1002 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_package)
NOTE: recipe gnu-efi-3.0.15-r0: task do_populate_sysroot: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_package: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_package: Succeeded
NOTE: Running task 1003 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_packagedata)
NOTE: recipe gnu-efi-3.0.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1004 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-bootconf-1.00-r0: task do_packagedata: Started
NOTE: recipe systemd-boot-252.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_packagedata: Succeeded
NOTE: Running task 1005 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_package_write_rpm)
NOTE: recipe systemd-bootconf-1.00-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-boot-252.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1006 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_configure)
NOTE: recipe systemd-boot-252.5-r0: task do_configure: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnu-efi-3.0.15-r0: task do_package: Succeeded
NOTE: Running task 1007 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_packagedata)
NOTE: recipe gnu-efi-3.0.15-r0: task do_packagedata: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_packagedata: Succeeded
NOTE: recipe systemd-boot-252.5-r0: task do_configure: Succeeded
NOTE: Running task 1008 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_compile)
NOTE: recipe systemd-boot-252.5-r0: task do_compile: Started
NOTE: recipe systemd-boot-252.5-r0: task do_compile: Succeeded
NOTE: Running task 1009 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_install)
NOTE: Running task 1010 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_deploy)
NOTE: recipe systemd-boot-252.5-r0: task do_deploy: Started
NOTE: recipe systemd-boot-252.5-r0: task do_install: Started
NOTE: recipe systemd-boot-252.5-r0: task do_deploy: Succeeded
NOTE: recipe systemd-boot-252.5-r0: task do_install: Succeeded
NOTE: Running task 1011 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_package)
NOTE: Running task 1012 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_populate_sysroot)
NOTE: recipe systemd-boot-252.5-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-boot-252.5-r0: task do_package: Started
NOTE: recipe systemd-boot-252.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-boot-252.5-r0: task do_package: Succeeded
NOTE: Running task 1013 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_packagedata)
NOTE: recipe systemd-boot-252.5-r0: task do_packagedata: Started
NOTE: recipe systemd-boot-252.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1014 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_package_write_rpm)
NOTE: Running task 1015 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_package_qa)
NOTE: recipe systemd-boot-252.5-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-boot-252.5-r0: task do_package_qa: Started
NOTE: recipe systemd-boot-252.5-r0: task do_package_qa: Succeeded
NOTE: recipe systemd-boot-252.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1016 of 1016 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_build)
NOTE: Tasks Summary: Attempted 1016 tasks of which 976 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 22 ERROR messages, returning a non-zero exit code.
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-src went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dbg went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtinfo went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncursesw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncurses went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libticw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtic went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanelw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanel went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenuw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenu went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libformw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libform went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-staticdev went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dev went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-doc went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-locale went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-tools went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo-base went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8936244146043696570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 58 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:646c1a5351f98186216e3a2e404e6c69fffbc715"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 25 Local 9 Mirrors 0 Missed 16 Current 232 (36% match, 93% complete)
Removing 1 stale sstate objects for arch cortexa15t2hf-neon...done.
Removing 1 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 233 of 257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 234 of 257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running task 765 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_fetch)
NOTE: Running task 774 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_fetch)
NOTE: Running task 814 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_fetch)
NOTE: Running task 847 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_write_config)
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_fetch: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_fetch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_fetch: Succeeded
NOTE: Running task 848 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_unpack)
NOTE: recipe systemd-boot-252.5-r0: task do_fetch: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_fetch: Succeeded
NOTE: Running task 849 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_unpack)
NOTE: recipe systemd-boot-252.5-r0: task do_write_config: Started
NOTE: recipe systemd-boot-252.5-r0: task do_fetch: Succeeded
NOTE: Running task 850 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_unpack)
NOTE: recipe systemd-boot-252.5-r0: task do_write_config: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_unpack: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_unpack: Succeeded
NOTE: Running task 851 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_patch)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnu-efi-3.0.15-r0: task do_unpack: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_unpack: Succeeded
NOTE: Running task 852 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_patch)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/ncurses/6.3+20220423-r0/temp/log.do_packagedata_setscene.940232
NOTE: recipe systemd-boot-252.5-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 254 of 257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_package_setscene)
NOTE: recipe systemd-bootconf-1.00-r0: task do_patch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_patch: Succeeded
NOTE: recipe gnu-efi-3.0.15-r0: task do_patch: Started
NOTE: Running task 853 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_deploy_source_date_epoch)
NOTE: recipe gnu-efi-3.0.15-r0: task do_patch: Succeeded
NOTE: Running task 854 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-bootconf-1.00-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnu-efi-3.0.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_package_setscene: Started
NOTE: recipe systemd-boot-252.5-r0: task do_unpack: Succeeded
NOTE: Running task 855 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_patch)
NOTE: recipe systemd-boot-252.5-r0: task do_patch: Started
NOTE: recipe systemd-boot-252.5-r0: task do_patch: Succeeded
NOTE: Running task 856 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 857 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_populate_lic)
NOTE: recipe systemd-boot-252.5-r0: task do_populate_lic: Started
NOTE: recipe systemd-boot-252.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-boot-252.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_populate_lic unihash changed to 8946bd1a3e958423b39636fe032746f5b20a6e68a3d2510c9f50919fa31ba1d9
NOTE: recipe systemd-boot-252.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 255 of 257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_packagedata_setscene)
NOTE: recipe glibc-2.36-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-2.36-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 964 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_prepare_recipe_sysroot)
NOTE: Running task 985 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata)
NOTE: Running task 990 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnu-efi-3.0.15-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 991 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_configure)
NOTE: Running task 992 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_configure)
NOTE: recipe systemd-bootconf-1.00-r0: task do_configure: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_configure: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_configure: Succeeded
NOTE: Running task 993 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_compile)
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata: Succeeded
NOTE: recipe gnu-efi-3.0.15-r0: task do_configure: Succeeded
NOTE: Running task 996 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_compile)
NOTE: recipe systemd-bootconf-1.00-r0: task do_compile: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_compile: Succeeded
NOTE: recipe gnu-efi-3.0.15-r0: task do_compile: Started
NOTE: Running task 997 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_install)
NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Succeeded
NOTE: Running task 998 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_package)
NOTE: recipe systemd-bootconf-1.00-r0: task do_package: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_compile: Succeeded
NOTE: Running task 999 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_install)
NOTE: recipe gnu-efi-3.0.15-r0: task do_install: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_install: Succeeded
NOTE: Running task 1000 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_populate_sysroot)
NOTE: Running task 1001 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_package)
NOTE: recipe gnu-efi-3.0.15-r0: task do_populate_sysroot: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_package: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1002 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-bootconf-1.00-r0: task do_package: Succeeded
NOTE: Running task 1003 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_packagedata)
NOTE: recipe systemd-boot-252.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_packagedata: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_packagedata: Succeeded
NOTE: Running task 1004 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_package_write_rpm)
NOTE: recipe systemd-bootconf-1.00-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-boot-252.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1005 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_configure)
NOTE: recipe systemd-boot-252.5-r0: task do_configure: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gnu-efi-3.0.15-r0: task do_package: Succeeded
NOTE: Running task 1006 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_packagedata)
NOTE: recipe gnu-efi-3.0.15-r0: task do_packagedata: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_packagedata: Succeeded
NOTE: recipe systemd-boot-252.5-r0: task do_configure: Succeeded
NOTE: Running task 1007 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_compile)
NOTE: recipe systemd-boot-252.5-r0: task do_compile: Started
NOTE: recipe systemd-boot-252.5-r0: task do_compile: Succeeded
NOTE: Running task 1008 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_install)
NOTE: Running task 1009 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_deploy)
NOTE: recipe systemd-boot-252.5-r0: task do_deploy: Started
NOTE: recipe systemd-boot-252.5-r0: task do_install: Started
NOTE: recipe systemd-boot-252.5-r0: task do_deploy: Succeeded
NOTE: recipe systemd-boot-252.5-r0: task do_install: Succeeded
NOTE: Running task 1010 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_package)
NOTE: Running task 1011 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_populate_sysroot)
NOTE: recipe systemd-boot-252.5-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-boot-252.5-r0: task do_package: Started
NOTE: recipe systemd-boot-252.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-boot-252.5-r0: task do_package: Succeeded
NOTE: Running task 1012 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_packagedata)
NOTE: recipe systemd-boot-252.5-r0: task do_packagedata: Started
NOTE: recipe systemd-boot-252.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1013 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_package_write_rpm)
NOTE: Running task 1014 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_package_qa)
NOTE: recipe systemd-boot-252.5-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-boot-252.5-r0: task do_package_qa: Started
NOTE: recipe systemd-boot-252.5-r0: task do_package_qa: Succeeded
NOTE: recipe systemd-boot-252.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1015 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_build)
NOTE: Tasks Summary: Attempted 1015 tasks of which 975 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 22 ERROR messages, returning a non-zero exit code.
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-src went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dbg went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtinfo went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncursesw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncurses went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libticw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtic went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanelw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanel went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenuw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenu went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libformw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libform went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-staticdev went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dev went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-doc went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-locale went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-tools went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo-base went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8936244146043696570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/systemd-boot: PKGV changed from 252.4 [default] to 252.5 [default]
packages/core2-32-poky-linux/systemd-boot: PV changed from "252.4" to "252.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PKGV changed from 252.4 [default] to 252.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dbg: PV changed from "252.4" to "252.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PKGV changed from 252.4 [default] to 252.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-dev: PV changed from "252.4" to "252.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PKGV changed from 252.4 [default] to 252.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-doc: PV changed from "252.4" to "252.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PKGV changed from 252.4 [default] to 252.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-locale: PV changed from "252.4" to "252.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PKGV changed from 252.4 [default] to 252.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-src: PV changed from "252.4" to "252.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PKGV changed from 252.4 [default] to 252.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot-staticdev: PV changed from "252.4" to "252.5"
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PKGV changed from 252.4 [default] to 252.5 [default]
packages/core2-32-poky-linux/systemd-boot/systemd-boot: PV changed from "252.4" to "252.5"

--===============8936244146043696570==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-systemd-boot-upgrade-252.4-252.5.patch"

RnJvbSAzNDZiYWZjOGM0MzAzNDE1NzYwMDBkMjQ3MDVhMGZjMWRlZDhjMzUyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAwNzoyNzo1NiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHN5
c3RlbWQtYm9vdDogdXBncmFkZSAyNTIuNCAtPiAyNTIuNQoKLS0tCiAuLi4vc3lzdGVtZC97c3lz
dGVtZC1ib290XzI1Mi40LmJiID0+IHN5c3RlbWQtYm9vdF8yNTIuNS5iYn0gICAgfCAwCiBtZXRh
L3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC97c3lzdGVtZC1ib290XzI1Mi40LmJi
ID0+IHN5c3RlbWQtYm9vdF8yNTIuNS5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjUyLjQuYmIgYi9tZXRhL3JlY2lwZXMtY29y
ZS9zeXN0ZW1kL3N5c3RlbWQtYm9vdF8yNTIuNS5iYgpzaW1pbGFyaXR5IGluZGV4IDEwMCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLWJvb3RfMjUyLjQuYmIK
cmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC1ib290XzI1Mi41LmJi
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5jIGIvbWV0
YS9yZWNpcGVzLWNvcmUvc3lzdGVtZC9zeXN0ZW1kLmluYwppbmRleCA5ZDc0N2VmNjRkLi5kZjI3
ZTAxYjFjIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtY29yZS9zeXN0ZW1kL3N5c3RlbWQuaW5j
CisrKyBiL21ldGEvcmVjaXBlcy1jb3JlL3N5c3RlbWQvc3lzdGVtZC5pbmMKQEAgLTE0LDcgKzE0
LDcgQEAgTElDRU5TRSA9ICJHUEwtMi4wLW9ubHkgJiBMR1BMLTIuMS1vbmx5IgogTElDX0ZJTEVT
X0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRS5HUEwyO21kNT03NTE0MTkyNjBhYTk1NDQ5OWY3YWJh
YWJhYTg4MmJiZSBcCiAgICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9MSUNFTlNFLkxHUEwyLjE7
bWQ1PTRmYmQ2NTM4MGNkZDI1NTk1MTA3OTAwOGIzNjQ1MTZjIgogCi1TUkNSRVYgPSAiNGI0ODEx
NzcxNmY4NDc1MWRjNmM4ZWUxNmM5NGRlOTg1OGVhZWY0ZiIKK1NSQ1JFViA9ICI2MWY1NzEwZDBi
ZmQ4ZjUyMmFmNmY4ZWVmMzk5YTg1MTUwOTk0NmUyIgogU1JDQlJBTkNIID0gInYyNTItc3RhYmxl
IgogU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3N5c3RlbWQvc3lzdGVtZC1zdGFibGUuZ2l0
O3Byb3RvY29sPWh0dHBzO2JyYW5jaD0ke1NSQ0JSQU5DSH0gXAogIgotLSAKMi4zNy4zCgo=

--===============8936244146043696570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (896 cached, 2 parsed). 1697 targets, 40 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:646c1a5351f98186216e3a2e404e6c69fffbc715"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

Initialising tasks...done.
Sstate summary: Wanted 23 Local 7 Mirrors 0 Missed 16 Current 234 (30% match, 93% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 235 of 257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene)
NOTE: Running setscene task 236 of 257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_populate_sysroot_setscene)
NOTE: Running task 853 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_fetch)
NOTE: Running task 861 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_fetch)
NOTE: Running task 905 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_fetch)
NOTE: Running task 951 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_write_config)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata_setscene: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_fetch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_fetch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_fetch: Succeeded
NOTE: Running task 960 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_unpack)
NOTE: Running task 961 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-boot-252.5-r0: task do_fetch: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_fetch: Succeeded
NOTE: Running task 962 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_unpack)
NOTE: Running task 963 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-boot-252.5-r0: task do_write_config: Started
NOTE: recipe systemd-boot-252.5-r0: task do_fetch: Succeeded
NOTE: Running task 964 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_unpack)
NOTE: recipe systemd-boot-252.5-r0: task do_write_config: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_unpack: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_unpack: Succeeded
NOTE: Running task 965 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_patch)
NOTE: recipe ncurses-6.3+20220423-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnu-efi-3.0.15-r0: task do_unpack: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_prepare_recipe_sysroot: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ncurses/6.3+20220423-r0/temp/log.do_packagedata_setscene.933626
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe gnu-efi-3.0.15-r0: task do_unpack: Succeeded
NOTE: Running setscene task 256 of 257 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_package_setscene)
NOTE: recipe systemd-boot-252.5-r0: task do_unpack: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_patch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_patch: Succeeded
NOTE: recipe gnu-efi-3.0.15-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 966 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_patch)
NOTE: Running task 967 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_deploy_source_date_epoch)
NOTE: recipe systemd-bootconf-1.00-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_patch: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_patch: Succeeded
NOTE: recipe systemd-bootconf-1.00-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 968 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_deploy_source_date_epoch)
NOTE: Running task 969 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_configure)
NOTE: recipe gnu-efi-3.0.15-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_configure: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_configure: Succeeded
NOTE: Running task 970 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_compile)
NOTE: recipe systemd-bootconf-1.00-r0: task do_compile: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ncurses-6.3+20220423-r0: task do_package_setscene: Started
NOTE: Running task 971 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_configure)
NOTE: recipe systemd-bootconf-1.00-r0: task do_compile: Succeeded
NOTE: Running task 972 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_install)
NOTE: recipe gnu-efi-3.0.15-r0: task do_configure: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Started
NOTE: recipe systemd-boot-252.5-r0: task do_unpack: Succeeded
NOTE: Running task 973 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_patch)
NOTE: recipe gnu-efi-3.0.15-r0: task do_configure: Succeeded
NOTE: Running task 974 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_compile)
NOTE: recipe systemd-boot-252.5-r0: task do_patch: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_install: Succeeded
NOTE: recipe gnu-efi-3.0.15-r0: task do_compile: Started
NOTE: Running task 975 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_package)
NOTE: recipe systemd-boot-252.5-r0: task do_patch: Succeeded
NOTE: Running task 976 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 977 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_populate_lic)
NOTE: recipe systemd-bootconf-1.00-r0: task do_package: Started
NOTE: recipe systemd-boot-252.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe systemd-boot-252.5-r0: task do_populate_lic: Started
NOTE: recipe systemd-boot-252.5-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_populate_lic unihash changed to 8946bd1a3e958423b39636fe032746f5b20a6e68a3d2510c9f50919fa31ba1d9
NOTE: recipe systemd-boot-252.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gnu-efi-3.0.15-r0: task do_compile: Succeeded
NOTE: Running task 978 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_install)
NOTE: recipe gnu-efi-3.0.15-r0: task do_install: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_package: Succeeded
NOTE: Running task 979 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_packagedata)
NOTE: recipe systemd-bootconf-1.00-r0: task do_packagedata: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 998 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb:do_packagedata)
NOTE: recipe gnu-efi-3.0.15-r0: task do_install: Succeeded
NOTE: Running task 999 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_populate_sysroot)
NOTE: Running task 1000 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_package)
NOTE: recipe gnu-efi-3.0.15-r0: task do_populate_sysroot: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_package: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_packagedata: Succeeded
NOTE: Running task 1001 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-bootconf_1.00.bb:do_package_write_rpm)
NOTE: recipe systemd-bootconf-1.00-r0: task do_package_write_rpm: Started
NOTE: recipe ncurses-6.3+20220423-r0: task do_packagedata: Succeeded
NOTE: recipe gnu-efi-3.0.15-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1004 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe systemd-boot-252.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe systemd-bootconf-1.00-r0: task do_package_write_rpm: Succeeded
NOTE: recipe systemd-boot-252.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1005 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_configure)
NOTE: recipe systemd-boot-252.5-r0: task do_configure: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_package: Succeeded
NOTE: Running task 1006 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.15.bb:do_packagedata)
NOTE: recipe gnu-efi-3.0.15-r0: task do_packagedata: Started
NOTE: recipe gnu-efi-3.0.15-r0: task do_packagedata: Succeeded
NOTE: recipe systemd-boot-252.5-r0: task do_configure: Succeeded
NOTE: Running task 1007 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_compile)
NOTE: recipe systemd-boot-252.5-r0: task do_compile: Started
NOTE: recipe systemd-boot-252.5-r0: task do_compile: Succeeded
NOTE: Running task 1008 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_install)
NOTE: Running task 1009 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_deploy)
NOTE: recipe systemd-boot-252.5-r0: task do_deploy: Started
NOTE: recipe systemd-boot-252.5-r0: task do_install: Started
NOTE: recipe systemd-boot-252.5-r0: task do_deploy: Succeeded
NOTE: recipe systemd-boot-252.5-r0: task do_install: Succeeded
NOTE: Running task 1010 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_package)
NOTE: Running task 1011 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_populate_sysroot)
NOTE: recipe systemd-boot-252.5-r0: task do_populate_sysroot: Started
NOTE: recipe systemd-boot-252.5-r0: task do_package: Started
NOTE: recipe systemd-boot-252.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe systemd-boot-252.5-r0: task do_package: Succeeded
NOTE: Running task 1012 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_packagedata)
NOTE: recipe systemd-boot-252.5-r0: task do_packagedata: Started
NOTE: recipe systemd-boot-252.5-r0: task do_packagedata: Succeeded
NOTE: Running task 1013 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_package_write_rpm)
NOTE: Running task 1014 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_package_qa)
NOTE: recipe systemd-boot-252.5-r0: task do_package_write_rpm: Started
NOTE: recipe systemd-boot-252.5-r0: task do_package_qa: Started
NOTE: recipe systemd-boot-252.5-r0: task do_package_qa: Succeeded
NOTE: recipe systemd-boot-252.5-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 1015 of 1015 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-boot_252.5.bb:do_build)
NOTE: Tasks Summary: Attempted 1015 tasks of which 975 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There was 1 WARNING message.
Summary: There were 22 ERROR messages, returning a non-zero exit code.
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-src went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dbg went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtinfo went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncursesw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libncurses went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libticw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libtic went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanelw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libpanel went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenuw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libmenu went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libformw went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-libform went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-staticdev went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-dev went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-doc went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-locale went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-tools went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo-base went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: QA Issue: Package version for package ncurses-terminfo went backwards which would break package feeds (from 0:6.4-r0 to 0:6.3+20220423-r0) [version-going-backwards]
ERROR: ncurses-6.3+20220423-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8936244146043696570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1697 targets, 68 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.

Summary: There was 1 WARNING message.
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: Nothing PROVIDES 'systemd-boot'
systemd-boot was skipped: incompatible with host mips-poky-linux (not in COMPATIBLE_HOST)

--===============8936244146043696570==--

