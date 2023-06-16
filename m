Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C90CC0502B
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:28 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.802.1686887482575530268
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=RshNc4wL;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010188c2544974-2837027a-038a-440d-8345-ec95d25969f4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=aY+OT2Qc2ZvKEzEsNOoNeSyzB1Ul3CE+sHmAD5k3wJI=;
	b=RshNc4wLBE7EBwALUCXZbXBrmxxEtju6GW60vv1RN823LtYOYYvATg8z5xa5RuMg
	cOGNYsxuMmciRvxIFlaP698WjrHEtl8xx5eWzjNPcJDvfleGkAAbxA7swJchzBGbEhK
	42fw6qKN6w4MXJY2lIQYb52bKgcAlJYleaceuj8I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=aY+OT2Qc2ZvKEzEsNOoNeSyzB1Ul3CE+sHmAD5k3wJI=;
	b=FitUAf/+l19lMnmnFHL7TEzeU7Nx6gskdZwlP/b9Rs5/crY61M29FbR6DB8PvJQ2
	dLzZ9OZqnRvYI3srtrJmtOzFPq62E5KPrggp1H77GkIMJsg9r77ydVYcKIygk6JChto
	wPORRaetCl3uGyYrmTb6dAi/dbjyJnOecmsDp1TY=
Content-Type: multipart/mixed; boundary="===============1068248349379527986=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ltp: upgrading to 20230516 SUCCEEDED
Message-ID: <01010188c2544974-2837027a-038a-440d-8345-ec95d25969f4-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182959

--===============1068248349379527986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ltp* to *20230516* has Succeeded.

Next steps:
    - apply the patch: git am 0001-ltp-upgrade-20230127-20230516.patch
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
From e9b3a397841b5d00855c85bc737832ccf90b282d Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 16:43:52 +0000
Subject: [PATCH] ltp: upgrade 20230127 -> 20230516

---
 meta/recipes-extended/ltp/{ltp_20230127.bb => ltp_20230516.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/ltp/{ltp_20230127.bb => ltp_20230516.bb} (99%)

diff --git a/meta/recipes-extended/ltp/ltp_20230127.bb b/meta/recipes-extended/ltp/ltp_20230516.bb
similarity index 99%
rename from meta/recipes-extended/ltp/ltp_20230127.bb
rename to meta/recipes-extended/ltp/ltp_20230516.bb
index 4325aa6672..8822fd4674 100644
--- a/meta/recipes-extended/ltp/ltp_20230127.bb
+++ b/meta/recipes-extended/ltp/ltp_20230516.bb
@@ -24,7 +24,7 @@ TUNE_CCARGS:remove:x86-64 = "-mfpmath=sse"
 
 CFLAGS:append:powerpc64 = " -D__SANE_USERSPACE_TYPES__"
 CFLAGS:append:mipsarchn64 = " -D__SANE_USERSPACE_TYPES__"
-SRCREV = "dd2d61ac1a1e09797a6165f478abd4a9f4f43035"
+SRCREV = "3ebc2dfa85c2445bb68d8c0d66e33c4da1e1b3a7"
 
 SRC_URI = "git://github.com/linux-test-project/ltp.git;branch=master;protocol=https \
            file://0001-Remove-OOM-tests-from-runtest-mm.patch \
-- 
2.39.2


--===============1068248349379527986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1802 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1802 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:139957818288bcea346f96136ccee884fc495c23"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 128 Local 28 Mirrors 0 Missed 100 Current 725 (21% match, 88% complete)
Removing 1 stale sstate objects for arch core2-64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 735 of 853 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 744 of 853 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 758 of 853 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 848 of 853 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-native-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 849 of 853 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/btrfs-tools/6.3-r0/temp/log.do_packagedata_setscene.2615753
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 850 of 853 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_package_setscene)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-native-30-r0: task do_populate_sysroot_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gawk/5.2.1-r0/temp/log.do_packagedata_setscene.2615969
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 851 of 853 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_setscene)
NOTE: Running task 1319 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_fetch)
NOTE: Running task 1540 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_fetch)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Started
NOTE: Running task 1618 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_validate_branches)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Succeeded
NOTE: Running task 1680 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_unpack)
NOTE: Running task 1681 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1753 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_fetch)
NOTE: Running task 1754 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_fetch)
NOTE: Running task 1755 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_fetch)
NOTE: Running task 1756 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_fetch)
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Started
NOTE: Running task 1834 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_fetch)
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1857 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_unpack)
NOTE: Running task 1858 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.3-r0: task do_package_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Started
NOTE: Running task 1908 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_populate_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Started
NOTE: Running task 1911 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_populate_sysroot)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_validate_branches: Started
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1955 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_fetch)
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Started
NOTE: recipe gzip-1.12-r0: task do_fetch: Started
NOTE: recipe cpio-2.14-r0: task do_fetch: Started
NOTE: recipe expect-5.45.4-r0: task do_fetch: Started
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Started
NOTE: Running task 2018 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_fetch)
NOTE: Running task 2019 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: Running task 2020 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_fetch)
NOTE: Running task 2022 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_fetch)
NOTE: recipe gzip-1.12-r0: task do_fetch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_fetch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 2042 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_unpack)
NOTE: Running task 2043 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_unpack)
NOTE: Running task 2044 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2045 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_unpack)
NOTE: recipe expect-5.45.4-r0: task do_fetch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Started
NOTE: Running task 2074 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_unpack)
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2154 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_populate_sysroot: Started
NOTE: recipe ltp-20230516-r0: task do_fetch: Started
NOTE: Running task 2155 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_unpack)
NOTE: Running task 2156 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2182 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_configure_ptest_base)
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Started
NOTE: Running task 2208 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_patch)
NOTE: Running task 2218 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe net-tools-2.10-r0: task do_fetch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Started
NOTE: recipe gdb-13.1-r0: task do_fetch: Started
NOTE: recipe gzip-1.12-r0: task do_unpack: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 2232 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: Running task 2233 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_unpack)
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expect-5.45.4-r0: task do_unpack: Started
NOTE: Running task 2243 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe cpio-2.14-r0: task do_unpack: Started
NOTE: recipe ltp-20230516-r0: task do_fetch: Succeeded
NOTE: Running task 2248 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_compile)
NOTE: Running task 2249 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_unpack)
NOTE: recipe gdb-13.1-r0: task do_fetch: Succeeded
NOTE: Running task 2262 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_unpack)
NOTE: Running task 2263 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe net-tools-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 2284 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_unpack)
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Started
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2285 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gzip-1.12-r0: task do_unpack: Succeeded
NOTE: Running task 2306 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_patch)
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Started
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Succeeded
NOTE: Running task 2336 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_patch)
NOTE: recipe expect-5.45.4-r0: task do_unpack: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_configure_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Succeeded
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: Running task 2358 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_patch)
NOTE: Running task 2374 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_patch)
NOTE: recipe cpio-2.14-r0: task do_unpack: Succeeded
NOTE: Running task 2409 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_patch)
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Started
NOTE: recipe iproute2-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2438 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_compile)
NOTE: recipe tar-1.34-r0: task do_compile: Started
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: Running task 2443 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_collect_spdx_deps)
NOTE: recipe gdb-13.1-r0: task do_unpack: Started
NOTE: Running task 2444 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: Running task 2446 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_collect_spdx_deps)
NOTE: recipe diffutils-3.9-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe gdb-13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2447 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_collect_spdx_deps)
NOTE: recipe ltp-20230516-r0: task do_unpack: Started
NOTE: Running task 2448 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_compile)
NOTE: Running task 2450 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_collect_spdx_deps)
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe gzip-1.12-r0: task do_patch: Started
NOTE: Running task 2451 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_patch)
NOTE: Running task 2467 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_collect_spdx_deps)
NOTE: recipe tcl-8.6.13-r0: task do_patch: Started
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Started
NOTE: Running task 2478 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_collect_spdx_deps)
NOTE: recipe cpio-2.14-r0: task do_patch: Started
NOTE: recipe expect-5.45.4-r0: task do_patch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Succeeded
NOTE: Running task 2479 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_collect_spdx_deps)
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_compile: Started
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2480 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2481 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_collect_spdx_deps)
NOTE: recipe iptables-1.8.9-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2483 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_collect_spdx_deps)
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Succeeded
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2484 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2485 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_collect_spdx_deps)
NOTE: recipe diffutils-3.9-r0: task do_compile: Started
NOTE: Running task 2487 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_collect_spdx_deps)
NOTE: recipe tcp-wrappers-7.6-r10: task do_collect_spdx_deps: Started
NOTE: recipe tcl-8.6.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe cronie-1.6.1-r0: task do_patch: Started
NOTE: Running task 2491 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2497 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe gzip-1.12-r0: task do_patch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cpio-2.14-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2498 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package_write_rpm)
NOTE: recipe unzip-1_6.0-r5: task do_collect_spdx_deps: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2501 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_populate_sysroot: Succeeded
NOTE: recipe which-2.21-r3: task do_collect_spdx_deps: Started
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cronie-1.6.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe tcl-8.6.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2502 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2503 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe cpio-2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gzip-1.12-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2504 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: Running task 2505 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe cronie-1.6.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2506 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_create_spdx)
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cpio-2.14-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata: Started
NOTE: Running task 2510 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_deploy_source_date_epoch)
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Succeeded
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2511 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_patch)
NOTE: Running task 2512 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_collect_spdx_deps)
NOTE: recipe gzip-1.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Started
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_collect_spdx_deps: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_create_spdx: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: Running task 2513 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx)
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2514 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Started
NOTE: recipe libaio-0.3.113-r0: task do_collect_spdx_deps: Started
NOTE: recipe libaio-0.3.113-r0: task do_patch: Started
NOTE: recipe curl-8.1.2-r0: task do_package_write_rpm: Started
NOTE: Running task 2515 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Started
NOTE: recipe unzip-1_6.0-r5: task do_collect_spdx_deps: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_create_spdx: Started
NOTE: Running task 2516 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx)
NOTE: recipe which-2.21-r3: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2517 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_create_spdx)
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2518 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_create_spdx)
NOTE: recipe cronie-1.6.1-r0: task do_patch: Succeeded
NOTE: Running task 2519 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2520 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_configure)
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Succeeded
NOTE: Running task 2521 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gdb-13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2522 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_patch)
NOTE: Running task 2523 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_collect_spdx_deps)
NOTE: recipe unzip-1_6.0-r5: task do_create_spdx: Started
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: recipe bc-1.07.1-r0: task do_create_spdx: Started
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2536 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Started
NOTE: recipe iproute2-6.3.0-r0: task do_configure: Started
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_patch: Started
NOTE: Running task 2538 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure)
NOTE: recipe net-tools-2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_validate_branches: Succeeded
NOTE: Running task 2539 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_metadata)
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: Running task 2540 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_configure)
NOTE: recipe net-tools-2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2541 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure)
NOTE: recipe gzip-1.12-r0: task do_configure: Started
NOTE: Running task 2542 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ltp-20230516-r0: task do_unpack: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2543 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_patch)
NOTE: Running task 2544 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_configure)
NOTE: recipe tcl-8.6.13-r0: task do_patch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_patch: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_kernel_metadata: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Started
NOTE: Running task 2545 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2546 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe cpio-2.14-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe ltp-20230516-r0: task do_patch: Started
NOTE: recipe libaio-0.3.113-r0: task do_patch: Succeeded
NOTE: Running task 2547 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_deploy_source_date_epoch)
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cronie-1.6.1-r0: task do_configure: Started
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe which-2.21-r3: task do_create_spdx: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bc-1.07.1-r0: task do_create_spdx: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_create_spdx: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_create_spdx: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_patch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2548 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 2552 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm)
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2553 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_configure)
NOTE: Running task 2554 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_compile)
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2555 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure)
NOTE: recipe ltp-20230516-r0: task do_patch: Succeeded
NOTE: Running task 2556 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_deploy_source_date_epoch)
NOTE: Running task 2557 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_populate_lic)
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2558 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_configure)
NOTE: recipe net-tools-2.10-r0: task do_configure: Started
NOTE: Running task 2559 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe socat-1.7.4.4-r0: task do_compile: Succeeded
NOTE: Running task 2560 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_install)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure: Started
NOTE: recipe iproute2-6.3.0-r0: task do_compile: Started
NOTE: recipe ltp-20230516-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20230516-r0: task do_populate_lic: Started
NOTE: recipe libaio-0.3.113-r0: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2561 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe socat-1.7.4.4-r0: task do_install: Started
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_configure: Succeeded
NOTE: Running task 2562 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe net-tools-2.10-r0: task do_compile: Started
NOTE: recipe ltp-20230516-r0: task do_populate_lic: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Succeeded
NOTE: Running task 2563 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_compile)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_populate_lic unihash changed to 6b88f8970844d4543941eefd5ce03a3931574075b4ac7e3e828876c02ba34b82
NOTE: recipe ltp-20230516-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_install: Succeeded
NOTE: Running task 2564 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_package)
NOTE: recipe libaio-0.3.113-r0: task do_compile: Succeeded
NOTE: Running task 2565 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_install)
NOTE: recipe socat-1.7.4.4-r0: task do_package: Started
NOTE: recipe gdb-13.1-r0: task do_unpack: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_install: Started
NOTE: Running task 2566 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_patch)
NOTE: Running task 2567 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_collect_spdx_deps)
NOTE: recipe gdb-13.1-r0: task do_patch: Started
NOTE: recipe gdb-13.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libaio-0.3.113-r0: task do_install: Succeeded
NOTE: Running task 2568 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package)
NOTE: Running task 2569 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot)
NOTE: recipe libaio-0.3.113-r0: task do_package: Started
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Started
NOTE: recipe gdb-13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 2570 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2571 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_collect_spdx_deps)
NOTE: recipe ltp-20230516-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe iproute2-6.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ltp-20230516-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2572 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_configure)
NOTE: recipe gdb-13.1-r0: task do_patch: Succeeded
NOTE: Running task 2573 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ltp-20230516-r0: task do_configure: Started
NOTE: recipe gdb-13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gdb-13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2574 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_configure)
NOTE: recipe gdb-13.1-r0: task do_configure: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm unihash changed to eb60b3710af72403bde4d457141e15c7d579346a1d9650ae53d8482309efe156
NOTE: recipe libaio-0.3.113-r0: task do_package: Succeeded
NOTE: Running task 2575 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata)
NOTE: recipe socat-1.7.4.4-r0: task do_package: Succeeded
NOTE: Running task 2576 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_packagedata)
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_kernel_metadata: Succeeded
NOTE: Running task 2577 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_patch)
NOTE: Running task 2578 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_version_sanity_check)
NOTE: recipe socat-1.7.4.4-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_patch: Started
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Succeeded
NOTE: Running task 2579 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_create_spdx)
NOTE: Running task 2580 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Started
NOTE: recipe diffutils-3.9-r0: task do_compile: Succeeded
NOTE: Running task 2581 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_compile_ptest_base)
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx: Succeeded
NOTE: Running task 2582 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_collect_spdx_deps)
NOTE: recipe diffutils-3.9-r0: task do_compile_ptest_base: Started
NOTE: recipe diffutils-3.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2583 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_install)
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ltp-20230516-r0: task do_collect_spdx_deps: Started
NOTE: recipe ltp-20230516-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_install: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_patch: Succeeded
NOTE: Running task 2584 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_configme)
NOTE: Running task 2585 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_kernel_configme: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tar-1.34-r0: task do_compile: Succeeded
NOTE: Running task 2586 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_install)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tar-1.34-r0: task do_install: Started
NOTE: recipe gdb-13.1-r0: task do_configure: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2587 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: Running task 2588 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_compile)
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Succeeded
NOTE: Running task 2589 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe gdb-13.1-r0: task do_compile: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2590 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile)
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Started
NOTE: recipe diffutils-3.9-r0: task do_install: Succeeded
NOTE: Running task 2591 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2592 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe diffutils-3.9-r0: task do_install_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe curl-8.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2593 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_package)
NOTE: recipe diffutils-3.9-r0: task do_package: Started
NOTE: recipe tar-1.34-r0: task do_install: Succeeded
NOTE: Running task 2594 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package)
NOTE: recipe cronie-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2595 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_compile)
NOTE: recipe tar-1.34-r0: task do_package: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_compile: Started
NOTE: Running task 2596 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2597 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2598 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install: Started
NOTE: recipe cronie-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2599 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2600 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe logrotate-3.21.0-r0: task do_install: Succeeded
NOTE: Running task 2601 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Started
NOTE: recipe cronie-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2602 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package)
NOTE: recipe cronie-1.6.1-r0: task do_package: Started
NOTE: recipe net-tools-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2603 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_install)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2604 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure_ptest_base)
NOTE: Running task 2605 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe net-tools-2.10-r0: task do_install: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2606 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile)
NOTE: recipe logrotate-3.21.0-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Started
NOTE: recipe net-tools-2.10-r0: task do_install: Succeeded
NOTE: Running task 2607 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package)
NOTE: recipe net-tools-2.10-r0: task do_package: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2608 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2609 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile)
NOTE: recipe tcl-8.6.13-r0: task do_compile: Started
NOTE: recipe iproute2-6.3.0-r0: task do_compile: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2610 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_install)
NOTE: Running task 2611 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata)
NOTE: recipe iproute2-6.3.0-r0: task do_install: Started
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Started
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Succeeded
NOTE: recipe tar-1.34-r0: task do_package: Succeeded
NOTE: Running task 2612 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_create_spdx)
NOTE: Running task 2613 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package_write_rpm)
NOTE: Running task 2614 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata)
NOTE: recipe diffutils-3.9-r0: task do_package: Succeeded
NOTE: Running task 2615 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_packagedata)
NOTE: recipe iproute2-6.3.0-r0: task do_install: Succeeded
NOTE: Running task 2616 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_package)
NOTE: recipe cronie-1.6.1-r0: task do_create_spdx: Started
NOTE: recipe tar-1.34-r0: task do_packagedata: Started
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe diffutils-3.9-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.3.0-r0: task do_package: Started
NOTE: recipe cronie-1.6.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2617 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile_ptest_base)
NOTE: recipe diffutils-3.9-r0: task do_packagedata: Succeeded
NOTE: Running task 2618 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_rpm)
NOTE: recipe tar-1.34-r0: task do_packagedata: Succeeded
NOTE: Running task 2619 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_create_spdx)
NOTE: Running task 2620 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm: Started
NOTE: recipe tar-1.34-r0: task do_create_spdx: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Started
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package: Succeeded
NOTE: Running task 2621 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2622 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe tar-1.34-r0: task do_create_spdx: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2623 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_create_spdx)
NOTE: Running task 2624 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_rpm)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2625 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_create_spdx: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Started
NOTE: recipe net-tools-2.10-r0: task do_create_spdx: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_package: Succeeded
NOTE: Running task 2626 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_packagedata)
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Started
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2627 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_create_spdx)
NOTE: Running task 2628 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package_write_rpm)
NOTE: recipe logrotate-3.21.0-r0: task do_create_spdx: Started
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_create_spdx: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_package: Succeeded
NOTE: Running task 2629 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_packagedata)
NOTE: recipe iproute2-6.3.0-r0: task do_packagedata: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile: Succeeded
NOTE: Running task 2630 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile_ptest_base)
NOTE: recipe iproute2-6.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2631 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_create_spdx)
NOTE: Running task 2632 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_package_write_rpm)
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Started
NOTE: recipe iproute2-6.3.0-r0: task do_create_spdx: Started
NOTE: recipe iproute2-6.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-6.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2633 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_install)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_install: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Succeeded
NOTE: Running task 2634 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2635 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_package)
NOTE: Running task 2636 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_populate_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2637 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_prepare_recipe_sysroot)
NOTE: recipe quota-4.09-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gzip-1.12-r0: task do_configure: Succeeded
NOTE: Running task 2638 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure_ptest_base)
NOTE: recipe quota-4.09-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2639 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_configure)
NOTE: recipe gzip-1.12-r0: task do_configure_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2640 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_compile)
NOTE: recipe quota-4.09-r0: task do_configure: Started
NOTE: recipe gzip-1.12-r0: task do_compile: Started
NOTE: recipe gzip-1.12-r0: task do_compile: Succeeded
NOTE: Running task 2641 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_compile_ptest_base)
NOTE: recipe gzip-1.12-r0: task do_compile_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2642 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_install)
NOTE: recipe gzip-1.12-r0: task do_install: Started
NOTE: recipe ltp-20230516-r0: task do_configure: Succeeded
NOTE: Running task 2643 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_compile)
NOTE: recipe ltp-20230516-r0: task do_compile: Started
NOTE: recipe gzip-1.12-r0: task do_install: Succeeded
NOTE: Running task 2644 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_install_ptest_base)
NOTE: recipe gzip-1.12-r0: task do_install_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2645 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_package)
NOTE: recipe gzip-1.12-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Succeeded
NOTE: Running task 2646 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2647 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_create_spdx)
NOTE: recipe libnl-1_3.7.0-r0: task do_create_spdx: Started
NOTE: recipe quota-4.09-r0: task do_configure: Succeeded
NOTE: Running task 2648 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_compile)
NOTE: recipe tcl-8.6.13-r0: task do_install: Succeeded
NOTE: Running task 2649 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_install_ptest_base)
NOTE: recipe quota-4.09-r0: task do_compile: Started
NOTE: recipe tcl-8.6.13-r0: task do_install_ptest_base: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_kernel_configme: Succeeded
NOTE: Running task 2650 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_configure)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_configure: Started
NOTE: recipe gzip-1.12-r0: task do_package: Succeeded
NOTE: Running task 2651 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_packagedata)
NOTE: recipe gzip-1.12-r0: task do_packagedata: Started
NOTE: recipe tcl-8.6.13-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2652 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_populate_sysroot)
NOTE: Running task 2653 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_package)
NOTE: Running task 2654 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_collect_spdx_deps)
NOTE: recipe quota-4.09-r0: task do_compile: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_populate_sysroot: Started
NOTE: Running task 2655 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_install)
NOTE: recipe tcl-8.6.13-r0: task do_package: Started
NOTE: recipe quota-4.09-r0: task do_collect_spdx_deps: Started
NOTE: recipe gzip-1.12-r0: task do_packagedata: Succeeded
NOTE: Running task 2656 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_create_spdx)
NOTE: Running task 2657 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_package_write_rpm)
NOTE: recipe quota-4.09-r0: task do_install: Started
NOTE: recipe gzip-1.12-r0: task do_create_spdx: Started
NOTE: recipe gzip-1.12-r0: task do_package_write_rpm: Started
NOTE: recipe quota-4.09-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cpio-2.14-r0: task do_configure: Succeeded
NOTE: Running task 2658 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_configure_ptest_base)
NOTE: recipe gzip-1.12-r0: task do_create_spdx: Succeeded
NOTE: recipe quota-4.09-r0: task do_install: Succeeded
NOTE: recipe cpio-2.14-r0: task do_configure_ptest_base: Started
NOTE: Running task 2659 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_package)
NOTE: recipe tcl-8.6.13-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cpio-2.14-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2660 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2661 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_compile)
NOTE: recipe expect-5.45.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cpio-2.14-r0: task do_compile: Started
NOTE: recipe quota-4.09-r0: task do_package: Started
NOTE: recipe expect-5.45.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2662 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_configure)
NOTE: recipe expect-5.45.4-r0: task do_configure: Started
NOTE: recipe gzip-1.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cpio-2.14-r0: task do_compile: Succeeded
NOTE: Running task 2663 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_compile_ptest_base)
NOTE: recipe cpio-2.14-r0: task do_compile_ptest_base: Started
NOTE: recipe cpio-2.14-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2664 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_install)
NOTE: recipe cpio-2.14-r0: task do_install: Started
NOTE: recipe cpio-2.14-r0: task do_install: Succeeded
NOTE: Running task 2665 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_install_ptest_base)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_configure: Succeeded
NOTE: Running task 2666 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_configcheck)
NOTE: recipe cpio-2.14-r0: task do_install_ptest_base: Started
NOTE: recipe quota-4.09-r0: task do_package: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_kernel_configcheck: Started
NOTE: Running task 2667 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_packagedata)
NOTE: recipe cpio-2.14-r0: task do_install_ptest_base: Succeeded
NOTE: recipe quota-4.09-r0: task do_packagedata: Started
NOTE: Running task 2668 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_package)
NOTE: recipe cpio-2.14-r0: task do_package: Started
NOTE: recipe quota-4.09-r0: task do_packagedata: Succeeded
NOTE: Running task 2669 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_create_spdx)
NOTE: Running task 2670 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_package_write_rpm)
NOTE: recipe quota-4.09-r0: task do_create_spdx: Started
NOTE: recipe quota-4.09-r0: task do_package_write_rpm: Started
NOTE: recipe quota-4.09-r0: task do_create_spdx: Succeeded
NOTE: recipe quota-4.09-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_package: Succeeded
NOTE: Running task 2671 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_packagedata)
NOTE: recipe cpio-2.14-r0: task do_package: Succeeded
NOTE: Running task 2672 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_packagedata)
NOTE: recipe tcl-8.6.13-r0: task do_packagedata: Started
NOTE: recipe cpio-2.14-r0: task do_packagedata: Started
NOTE: recipe tcl-8.6.13-r0: task do_packagedata: Succeeded
NOTE: Running task 2673 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_create_spdx)
NOTE: recipe tcl-8.6.13-r0: task do_create_spdx: Started
NOTE: recipe cpio-2.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2674 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_create_spdx)
NOTE: Running task 2675 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_package_write_rpm)
NOTE: recipe cpio-2.14-r0: task do_create_spdx: Started
NOTE: recipe cpio-2.14-r0: task do_package_write_rpm: Started
NOTE: recipe cpio-2.14-r0: task do_create_spdx: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_configure: Succeeded
NOTE: Running task 2676 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_configure_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_create_spdx: Succeeded
NOTE: Running task 2677 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_collect_spdx_deps)
NOTE: recipe expect-5.45.4-r0: task do_configure_ptest_base: Started
NOTE: recipe expect-5.45.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2678 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_compile)
NOTE: recipe expect-5.45.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe expect-5.45.4-r0: task do_compile: Started
NOTE: recipe expect-5.45.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cpio-2.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_compile: Succeeded
NOTE: Running task 2679 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_compile_ptest_base)
NOTE: recipe expect-5.45.4-r0: task do_compile_ptest_base: Started
NOTE: recipe expect-5.45.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2680 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_install)
NOTE: recipe expect-5.45.4-r0: task do_install: Started
NOTE: recipe expect-5.45.4-r0: task do_install: Succeeded
NOTE: Running task 2681 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_install_ptest_base)
NOTE: recipe expect-5.45.4-r0: task do_install_ptest_base: Started
NOTE: recipe expect-5.45.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2682 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package)
NOTE: recipe expect-5.45.4-r0: task do_package: Started
NOTE: recipe expect-5.45.4-r0: task do_package: Succeeded
NOTE: Running task 2683 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_packagedata)
NOTE: recipe expect-5.45.4-r0: task do_packagedata: Started
NOTE: recipe expect-5.45.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2684 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_create_spdx)
NOTE: Running task 2685 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_rpm)
NOTE: recipe expect-5.45.4-r0: task do_create_spdx: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_kernel_configcheck: Succeeded
NOTE: Running task 2686 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_compile)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_compile: Started
NOTE: recipe expect-5.45.4-r0: task do_create_spdx: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdb-13.1-r0: task do_compile: Succeeded
NOTE: Running task 2687 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_install)
NOTE: recipe gdb-13.1-r0: task do_install: Started
NOTE: recipe gdb-13.1-r0: task do_install: Succeeded
NOTE: Running task 2688 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_package)
NOTE: recipe gdb-13.1-r0: task do_package: Started
NOTE: recipe gdb-13.1-r0: task do_package: Succeeded
NOTE: Running task 2689 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_packagedata)
NOTE: recipe gdb-13.1-r0: task do_packagedata: Started
NOTE: recipe gdb-13.1-r0: task do_packagedata: Failed
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_compile: Succeeded
NOTE: recipe ltp-20230516-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2689 tasks of which 2455 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 47 ERROR messages, returning a non-zero exit code.
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-src went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dbg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-ptest went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-gawkbug went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-staticdev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-doc went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-bg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ca went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-da went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-de went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-es went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fi went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fr went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-id went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-it went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ja went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ko went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ms went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-nl went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pl went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pt went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pt-br went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ro went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-sr went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-sv went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-vi went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-zh-cn went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-src went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-dbg went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdbserver went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-staticdev went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-dev went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-doc went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-locale went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gdb/13.1-r0/temp/log.do_packagedata.3150278
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_packagedata) failed with exit code '1'

--===============1068248349379527986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/ltp: PKGV changed from 20230127 [default] to 20230516 [default]
packages/core2-32-poky-linux/ltp: PV changed from "20230127" to "20230516"
packages/core2-32-poky-linux/ltp/ltp-dbg: PKGV changed from 20230127 [default] to 20230516 [default]
packages/core2-32-poky-linux/ltp/ltp-dbg: PKGSIZE changed from 782297668 to 793638944 (+1%)
packages/core2-32-poky-linux/ltp/ltp-dbg: PV changed from "20230127" to "20230516"
packages/core2-32-poky-linux/ltp/ltp-dbg: FILELIST: removed "/opt/ltp/testcases/bin/.debug/ns_ifmove /opt/ltp/testcases/bin/.debug/ns_create /opt/ltp/testcases/bin/.debug/utstest /opt/ltp/testcases/bin/.debug/semget03 /opt/ltp/testcases/bin/.debug/semget06 /opt/ltp/testcases/bin/.debug/tomoyo_filesystem_test /opt/ltp/testcases/bin/.debug/tomoyo_accept_test /opt/ltp/testcases/bin/.debug/sem02 /opt/ltp/testcases/bin/.debug/sem01 /opt/ltp/testcases/bin/.debug/setns_check /opt/ltp/testcases/bin/.debug/tomoyo_new_test /opt/ltp/testcases/bin/.debug/tomoyo_new_file_test /opt/ltp/testcases/bin/.debug/tomoyo_rewrite_test /opt/ltp/testcases/bin/.debug/ns_exec /opt/ltp/testcases/bin/.debug/fcntl06_64 /opt/ltp/testcases/bin/.debug/tomoyo_file_test /opt/ltp/testcases/bin/.debug/fcntl06 /opt/ltp/testcases/bin/.debug/newns /opt/ltp/testcases/bin/.debug/tomoyo_policy_io_test /opt/ltp/testcases/bin/.debug/tomoyo_policy_memory_test", added "/opt/ltp/testcases/bin/.debug/tst_ns_ifmove /opt/ltp/testcase
 s/bin/.debug/hugemmap32 /opt/ltp/testcases/bin/.debug/kvm_svm01 /opt/ltp/testcases/bin/.debug/semop04 /opt/ltp/testcases/bin/.debug/semop05 /opt/ltp/testcases/bin/.debug/tst_fsfreeze /opt/ltp/testcases/bin/.debug/mmap20 /opt/ltp/testcases/bin/.debug/mq_notify03 /opt/ltp/testcases/bin/.debug/madvise11 /opt/ltp/testcases/bin/.debug/tst_ns_create /opt/ltp/testcases/bin/.debug/cgroup_core03 /opt/ltp/testcases/bin/.debug/tst_ns_exec /opt/ltp/testcases/bin/.debug/fsconfig03 /opt/ltp/testcases/bin/.debug/mount07 /opt/ltp/testcases/bin/.debug/utsname01 /opt/ltp/testcases/bin/.debug/utsname02 /opt/ltp/testcases/bin/.debug/utsname03 /opt/ltp/testcases/bin/.debug/utsname04 /opt/ltp/testcases/bin/.debug/mprotect05"
packages/core2-32-poky-linux/ltp/ltp-dev: PKGV changed from 20230127 [default] to 20230516 [default]
packages/core2-32-poky-linux/ltp/ltp-dev: PKGSIZE changed from 273448 to 275282 (+1%)
packages/core2-32-poky-linux/ltp/ltp-dev: PV changed from "20230127" to "20230516"
packages/core2-32-poky-linux/ltp/ltp-doc: PKGV changed from 20230127 [default] to 20230516 [default]
packages/core2-32-poky-linux/ltp/ltp-doc: PV changed from "20230127" to "20230516"
packages/core2-32-poky-linux/ltp/ltp-locale: PKGV changed from 20230127 [default] to 20230516 [default]
packages/core2-32-poky-linux/ltp/ltp-locale: PV changed from "20230127" to "20230516"
packages/core2-32-poky-linux/ltp/ltp-src: PKGV changed from 20230127 [default] to 20230516 [default]
packages/core2-32-poky-linux/ltp/ltp-src: PKGSIZE changed from 13163667 to 12995589 (-1%)
packages/core2-32-poky-linux/ltp/ltp-src: PV changed from "20230127" to "20230516"
packages/core2-32-poky-linux/ltp/ltp-src: FILELIST: directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/openfile -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/openfile, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mq_timedreceive -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mq_timedreceive, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_getparam -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_getparam, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setdomainname -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setdomainname, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_setparam -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_setparam, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ulimit -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscall
 s/ulimit, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/unshare -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/unshare, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_return -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_return, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/memcg/control -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/memcg/control, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_read -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_read, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/uevents -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/uevents, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getitimer -> /usr/src/debug/ltp/
 20230516-r0/testcases/kernel/syscalls/getitimer, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/dup -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/dup, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_unlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprioceiling -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprotocol, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/open_tree -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/open_tree, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/time -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/time, di
 rectory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rt_sigqueueinfo -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/rt_sigqueueinfo, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fremovexattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fremovexattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getcwd -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getcwd, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sysconf -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sysconf, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/async_handler -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/async_handler, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/shmt -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/shmt, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_t
 estsuite/conformance/interfaces/mq_send -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_send, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_detach, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/nfsv4/acl -> /usr/src/debug/ltp/20230516-r0/testcases/network/nfsv4/acl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/msgsnd -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/msgsnd, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rt_sigaction -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/rt_sigaction, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mmap -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/confo
 rmance/interfaces/mmap, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pivot_root -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pivot_root, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setuid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setuid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/set_mempolicy -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/set_mempolicy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/umount2 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/umount2, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/time
  -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_init -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/strncpy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/kill -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/kill, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/math/atof -> /usr/src/debug/ltp/20230516-r0/testcases/misc/math/atof, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/fork -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/fork, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/oom -> /usr/src/debug/ltp/20230516-r0/testcases/kerne
 l/mem/oom, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cgroup_fj -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cgroup_fj, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/bind -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/bind, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/packet -> /usr/src/debug/ltp/20230516-r0/testcases/network/packet, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_write -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_write, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/dup3 -> /usr/src/debug/ltp/202305
 16-r0/testcases/kernel/syscalls/dup3, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/dup2 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/dup2, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/memcg/stress -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/memcg/stress, directory renamed /usr/src/debug/ltp/20230127-r0/lib -> /usr/src/debug/ltp/20230516-r0/lib, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/raise -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/raise, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ustat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ustat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/openat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/openat, directory renamed /usr/src/debug/ltp/20230127-r0/te
 stcases/open_posix_testsuite/conformance/interfaces/pthread_testcancel -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_init, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/strcpy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/strcpy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pidfd_send_signal -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pidfd_send_signal, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_destroy -> /usr/src/debug/ltp/20230516-r0/te
 stcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount_setattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mount_setattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_open -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_open, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/shm_open -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/shm_open, directory renamed /usr/src/debug/ltp/20230127-r0/libs/libltpvdso -> /usr/src/debug/ltp/20230516-r0/libs/libltpvdso, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/set_robust_list -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/set_robust_list, directory renamed /usr/src/debug/ltp/20230127-r0/
 testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_unlock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprioceiling, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedwrlock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedwrlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigwait -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigwait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mallinfo2 ->
  /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mallinfo2, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_settype -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_settype, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_max -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_max, directory renamed /usr/src/debug/ltp/20230127-r0/tools/apicmds -> /usr/src/debug/ltp/20230516-r0/tools/apicmds, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformanc
 e/interfaces/pthread_setcanceltype -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_delete, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/nanosleep -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/nanosleep, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedparam -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_setprioceiling, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fanotify -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fano
 tify, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuset/cpuset_lib -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuset/cpuset_lib, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fchmodat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fchmodat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fchownat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fchownat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/irq -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/irq, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sysfs -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sysfs, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/localtime -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched, 
 directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/stress/mqueues -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/stress/mqueues, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/f00f -> /usr/src/debug/ltp/20230516-r0/testcases/misc/f00f, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/crypto -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/crypto, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/commands/file/datafiles -> /usr/src/debug/ltp/20230516-r0/testcases/commands/file/datafiles, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getschedparam -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/behavior/WIFEXITED, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/uaccess -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/uaccess, directory renamed /usr/src/
 debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedparam, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/newuname -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/newuname, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/vmsplice -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/vmsplice, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/hyperthreading/ht_enabled -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/hyperthreading/ht_enabled, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstack -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/
 open_posix_testsuite/conformance/interfaces/pthread_attr_setstack -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstack, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_wait -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_wait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/cfs-scheduler -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/cfs-scheduler, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/acct -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/acct, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/openat2 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/openat2, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setrlimit -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/
 syscalls/setrlimit, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaddset -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaddset, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/functional/threads/schedule -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getclock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/close -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/close, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/definitions/signal_h -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/definitions/signal_h, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_destroy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_
 testsuite/conformance/interfaces/pthread_testcancel, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setresgid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setresgid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setresuid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setresuid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_lock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_lock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getcpu -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getcpu, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/asctime -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope, directory renamed /usr/src/deb
 ug/ltp/20230127-r0/testcases/kernel/syscalls/perf_event_open -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/perf_event_open, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ioperm -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ioperm, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/shmat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/shmat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/getpid -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_tryrdlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setpgid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setpgid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/fs_fill -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/fs_fill, directory renamed /usr/src/debug/ltp/
 20230127-r0/testcases/kernel/syscalls/statvfs -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/statvfs, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/exit_group -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/exit_group, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigwaitinfo -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigwaitinfo, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/page -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/page, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/asctime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/finit_module -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fi
 nit_module, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/timer_getoverrun -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/timer_getoverrun, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigtimedwait -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigtimedwait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_open/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_open/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/epoll_create -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/epoll_create, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/memfd_create -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/memfd_create, directory renamed /usr/src/debug/ltp/2023
 0127-r0/testcases/kernel/syscalls/set_tid_address -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/set_tid_address, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_notify -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_notify, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_init -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_init, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/rt-migrate -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/rt-migrate, directory renamed /usr/src/debug/ltp/20230127-r0/testcases
 /open_posix_testsuite/conformance/interfaces/pthread_cleanup_pop -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_push, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/readdir -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/readdir, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/swapoff -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/swapoff, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/wait -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/wait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/math/float/iperb -> /usr/src/debug/ltp/20230516-r0/testcases/misc/math/float/iperb, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getscope -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/time, direc
 tory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setscope, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getpgrp -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getpgrp, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/strchr -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mq_timedsend -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mq_timedsend, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/waitpid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/waitpid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/
 sysinfo -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sysinfo, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sighold, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/kcmp -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/kcmp, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/chown -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/chown, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/tbio/tbio_kernel -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/tbio/tbio_kernel, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/utimes -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/utimes, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_te
 stsuite/functional/semaphores -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/functional/semaphores, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/move_pages -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/move_pages, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/munmap -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/munmap, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fsync -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fsync, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_join/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigfillset -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/co
 nformance/interfaces/pthread_rwlockattr_init, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/clock_nanosleep -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/clock_nanosleep, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/libcontrollers -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/libcontrollers, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/memset -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/memset, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/integrity/ima/src -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/integrity/ima/src, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sgetmask -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sgetmask, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mlockall -> /usr/src/debug/ltp/2
 0230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mlockall, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/open -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/open, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setreuid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setreuid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/signalfd -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/signalfd, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setfsuid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setfsuid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setfsgid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setfsgid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/inode -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/inode, directory renamed /usr/s
 rc/debug/ltp/20230127-r0/testcases/kernel/syscalls/fsopen -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fsopen, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sendfile -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sendfile, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_get_priority_max -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_get_priority_max, directory renamed /usr/src/debug/ltp/20230127-r0/libs/libltpnewipc -> /usr/src/debug/ltp/20230516-r0/libs/libltpnewipc, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/socket -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/socket, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/testfrmw -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/testfrmw, directory renamed /usr/src/debug/ltp/20230127-r0/testca
 ses/kernel/syscalls/fchmod -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fchmod, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/read -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/read, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/munlockall, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_settime/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_settime/speculative, directory renamed /usr/src/d
 ebug/ltp/20230127-r0/testcases/kernel/syscalls/mkdir -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mkdir, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getspecific -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_init, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setspecific -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/functional/threads/schedule, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/math/fptests -> /usr/src/debug/ltp/20230516-r0/testcases/misc/math/fptests, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_exit -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_exit, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sy
 scalls/execve -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/execve, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/nptl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/nptl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/vmtests -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/vmtests, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_self -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/strchr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/execvp -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/execvp, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_once -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_once, directory renamed /usr/src/debug/ltp/20230127-r0/test
 cases/realtime/perf/latency -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/perf/latency, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_join -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_join, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/clock_gettime -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/clock_gettime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/clock_settime -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/clock_settime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_kill, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/sched_stress -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sc
 hed/sched_stress, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/dirtyc0w_shmem -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/dirtyc0w_shmem, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/hyperthreading/ht_affinity -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/hyperthreading/ht_affinity, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setegid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setegid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/uname -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/uname, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/adjtimex -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/adjtimex, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getuid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getuid, directory renamed /usr/sr
 c/debug/ltp/20230127-r0/testcases/kernel/syscalls/io_setup -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/io_setup, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/memctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/memctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/kvm -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/kvm, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getpgid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getpgid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/quotactl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/quotactl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/migrate_pages -> /usr/src/debug/ltp/20230516-r0/t
 estcases/kernel/syscalls/migrate_pages, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getdtablesize -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getdtablesize, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/io_uring -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/io_uring, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/llistxattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/llistxattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/functional/timers/clocks -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/functional/timers/clocks, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/epoll -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/epoll, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/behavior/timers -> /usr/src/debug/ltp/2023051
 6-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_setpshared, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/readahead -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/readahead, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/io_getevents -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/io_getevents, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/mem -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/mem, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuset/cpuset_load_balance_test -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuset/cpuset_load_balance_test, directory
  renamed /usr/src/debug/ltp/20230127-r0/testcases/network/lib6 -> /usr/src/debug/ltp/20230516-r0/testcases/network/lib6, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/signal -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/signal, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/swapon -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/swapon, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugeshmctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugeshmctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/io_cancel -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/io_cancel, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/pi_perf -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/pi_perf, directory renamed /usr/src/debug/ltp/20230127-r0/tes
 tcases/kernel/syscalls/lremovexattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/lremovexattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/pi-tests -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/pi-tests, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/pthreads -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/pthreads, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_init -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_init, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mkdirat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mkdirat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_wait -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/in
 terfaces/pthread_barrier_wait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/add_key -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/add_key, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/memcg -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/memcg, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/umask -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/umask, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/multicast/mc_member -> /usr/src/debug/ltp/20230516-r0/testcases/network/multicast/mc_member, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/gmtime -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mktime -> /usr/src/debu
 g/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/strlen, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/definitions/mqueue_h -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_getscheduler -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_getscheduler, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_setscheduler -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_setscheduler, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/io/direct_io ->
  /usr/src/debug/ltp/20230516-r0/testcases/kernel/io/direct_io, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_setattr -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_setattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/zram -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/zram, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/close_range -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/close_range, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_close -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_close, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getcontext -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getcontext, directory renamed /usr/src/debug/l
 tp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getinheritsched -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_setpshared, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setinheritsched, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/sched_football -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/sched_football, directory renamed /usr/src/debug/ltp/20230127-r0/include -> /usr/src/debug/ltp/20230516-r0/include, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/preadv -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/preadv, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigemptyset -> 
 /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrier_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/pan -> /usr/src/debug/ltp/20230516-r0/pan, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/llseek -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/llseek, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/iopl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/iopl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigsuspend -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigsuspend, directory renamed /usr/src/debug/ltp/20230127-r0/libs/libltpswap -> /usr/src/debug/ltp/20230516-r0/libs/libltpswap, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/stress/pi-tests -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/stress/pi-tests, directory renam
 ed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/select -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/select, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/symlink -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/symlink, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getrandom -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getrandom, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/fs_perms -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/fs_perms, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fstat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fstat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setgroups -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setgroups, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_op
 en -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_open, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/stress/ns-tools -> /usr/src/debug/ltp/20230516-r0/testcases/network/stress/ns-tools, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaction -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaction, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/gethostbyname_r -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/gethostbyname_r, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_destroy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugefork -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb
 /hugefork, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pipe -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pipe, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fchdir -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fchdir, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigprocmask -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigprocmask, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ptrace -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ptrace, directory renamed /usr/src/debug/ltp/20230127-r0/utils/sctp/testlib -> /usr/src/debug/ltp/20230516-r0/utils/sctp/testlib, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/capset -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/capset, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fstatfs -> /usr/src/debug/ltp/202
 30516-r0/testcases/kernel/syscalls/fstatfs, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/connectors/pec -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/connectors/pec, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/tcp_cmds/sendfile -> /usr/src/debug/ltp/20230516-r0/testcases/network/tcp_cmds/sendfile, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_suspend -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_suspend, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_sigmask -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_tests
 uite/conformance/interfaces/pthread_sigmask, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigfillset, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/munlockall -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/munlockall, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/securebits -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/securebits, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mq_unlink -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mq_unlink, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/modify_ldt -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/modify_ldt, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/syslog -> /us
 r/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/syslog, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/strncpy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigemptyset, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/recvmsg -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/recvmsg, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/timer_gettime -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/timer_gettime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/timer_settime -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/timer_settime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/renameat2 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/renameat2, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conform
 ance/interfaces/mq_timedreceive/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedreceive/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getppid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getppid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/measurement -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/measurement, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/math/float/exp_log -> /usr/src/debug/ltp/20230516-r0/testcases/misc/math/float/exp_log, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/chdir -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/chdir, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/membarrier -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/membarrier, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sysc
 alls/setsockopt -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setsockopt, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/truncate -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/truncate, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/can/cve -> /usr/src/debug/ltp/20230516-r0/testcases/network/can/cve, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/include -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/include, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcancelstate, directory renamed /usr/src/debug/
 ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugeshmdt -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugeshmdt, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/netns -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/netns, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/lib -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/lib, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuacct -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuacct, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/munlock -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/munlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/nice -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/nice, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/symlinkat -> /usr/src/debug/ltp/202
 30516-r0/testcases/kernel/syscalls/symlinkat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/chmod -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/chmod, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/execl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/execl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/unlink -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/unlink, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_rr_get_interval -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_rr_get_interval, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/execv -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/execv, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fmtmsg -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fmtmsg, directory renamed /usr/src/
 debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getpshared -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_equal, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setpshared -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcanceltype, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sound -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sound, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ppoll -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ppoll, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_unlink, directory renamed /usr/src/debug/ltp/20230127-r0/testcas
 es/open_posix_testsuite/conformance/interfaces/shm_unlink -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/shm_unlink, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/include -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/include, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_setparam -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_setparam, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaltstack -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigaltstack, directory renamed
  /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/pthread_kill_latency -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/pthread_kill_latency, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_destroy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_init, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mlock/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mlock/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigismember -> /usr/src/debug/ltp/202
 30516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigismember, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/io/ltp-aiodio -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/io/ltp-aiodio, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pwritev -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pwritev, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/times -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/times, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/prctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/prctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_trylock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_trylock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/prio-wake -> /usr/sr
 c/debug/ltp/20230516-r0/testcases/realtime/func/prio-wake, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/gettid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/gettid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstacksize, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rt_sigprocmask -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/rt_sigprocmask, directory renamed /usr/src/debug/ltp/20230127-r0/utils/sctp/include/netinet -> /usr/src/debug/ltp/20230516-r0/utils/sctp/include/netinet, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_init -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_init, director
 y renamed /usr/src/debug/ltp/20230127-r0/testcases/network/tcp_cmds/include -> /usr/src/debug/ltp/20230516-r0/testcases/network/tcp_cmds/include, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/init_module -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/init_module, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pipe2 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pipe2, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_getcpuclockid -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_getcpuclockid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sockioctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sockioctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/settimeofday -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/settime
 ofday, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigwaitinfo -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigwaitinfo, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/splice -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/splice, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/lchown -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/lchown, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/delete_module -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/delete_module, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rt_sigtimedwait -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/rt_sigtimedwait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedparam/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_t
 estsuite/conformance/interfaces/pthread_attr_setschedparam/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/mtest05 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/mtest05, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/mtest07 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/mtest07, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/mtest06 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/mtest06, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/mtest01 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/mtest01, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/multicast/mc_commo -> /usr/src/debug/ltp/20230516-r0/testcases/network/multicast/mc_commo, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/block/block_dev_user -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/block/block_dev_user, directory
  renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_get_priority_min -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_get_priority_min, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/bpf -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/bpf, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/memcmp -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/memcmp, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getdetachstate -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_delete, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setdetachstate -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setdetachstate, directory renamed /usr/src/debug/ltp/20230127-r0/
 testcases/kernel/mem/hugetlb/hugefallocate -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugefallocate, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_equal -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getpshared, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/math/float/power -> /usr/src/debug/ltp/20230516-r0/testcases/misc/math/float/power, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuctl_fj -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuctl_fj, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sighold -> /usr/src/debug/ltp/20230516-r0/tes
 tcases/kernel/syscalls/sighold, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/pci/tpci_user -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/pci/tpci_user, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/name_to_handle_at -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/name_to_handle_at, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pwrite -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pwrite, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuset/cpuset_hotplug_test -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuset/cpuset_hotplug_test, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/functional/threads/condvar -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/functional/threads/condvar, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sysca
 lls/mlock2 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mlock2, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/hotplug/memory_hotplug -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/hotplug/memory_hotplug, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pidfd_open -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pidfd_open, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cgroup_xattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cgroup_xattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/accept4 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/accept4, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/libclone -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/libclone, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rt_tgsigqueueinfo -> /usr/src/debug/ltp/202
 30516-r0/testcases/kernel/syscalls/rt_tgsigqueueinfo, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fdatasync -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fdatasync, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/semctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/semctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/shmctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/shmctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fpathconf -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fpathconf, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/msgctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/msgctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/alarm -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/alarm, directory
  renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/copy_file_range -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/copy_file_range, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pidfd_getfd -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pidfd_getfd, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sync_file_range -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sync_file_range, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/matrix_mult -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/matrix_mult, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/killpg -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_post, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getxattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ge
 txattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/cpufreq -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/cpufreq, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getdents -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getdents, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/math/abs -> /usr/src/debug/ltp/20230516-r0/testcases/misc/math/abs, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/tunable -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/tunable, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mlockall/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mlockall/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/libs/libltpuinput -> /usr/src/debug/ltp/20230516-r0/libs/libltpuinput, directory renamed /usr/src/debug/ltp/202301
 27-r0/testcases/kernel/syscalls/setpriority -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setpriority, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/remap_file_pages -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/remap_file_pages, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sysctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sysctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/netstress -> /usr/src/debug/ltp/20230516-r0/testcases/network/netstress, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getdomainname -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getdomainname, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/multicast/mc_opts -> /usr/src/debug/ltp/20230516-r0/testcases/network/multicast/mc_opts, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/io_destroy -> /usr/src/de
 bug/ltp/20230516-r0/testcases/kernel/syscalls/io_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/lio_listio -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/lio_listio, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigpending -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setclock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setitimer -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setitimer, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/clisrv -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/clisrv, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/sctp -> /usr/src/debug/ltp/20230516-r0/testcases/network/sctp, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/command
 s/nm/datafiles -> /usr/src/debug/ltp/20230516-r0/testcases/commands/nm/datafiles, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/profil -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/profil, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_timedwait -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_timedwait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/tools -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/tools, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/stime -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/stime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugeshmat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugeshmat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/
 kernel/syscalls/recv -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/recv, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/personality -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/personality, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/acpi -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/acpi, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_timedlock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_timedlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/math/float/trigo -> /usr/src/debug/ltp/20230516-r0/testcases/misc/math/float/trigo, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fork -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fork, directory renamed /usr/src/debug/ltp/20230127-r0/testcases
 /open_posix_testsuite/conformance/interfaces/pthread_attr_destroy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigrelse, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/preadv2 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/preadv2, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/gethostname -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/gethostname, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getpeername -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getpeername, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getsockname -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getsockname, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/timer_delete -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/timer_delete, directory renamed /usr/src/debug/ltp/20
 230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_init -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_init, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/capget -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/capget, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigpause -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigpause, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/creat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/creat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getsid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getsid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/shmdt -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/shmdt, directory re
 named /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_create/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_create/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_delete/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_delete/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/connect -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/connect, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/cma -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/cma, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/lib -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/lib, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/mmapstress -> /usr/src/debug/
 ltp/20230516-r0/testcases/kernel/mem/mmapstress, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pause -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pause, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_receive -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_receive, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/nfs/nfslock01 -> /usr/src/debug/ltp/20230516-r0/testcases/network/nfs/nfslock01, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_timedsend/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/commands/eject -> /usr/src/debug/ltp/20230516-r0/testcases/commands/eject, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/mis
 c/crash -> /usr/src/debug/ltp/20230516-r0/testcases/misc/crash, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/abort -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/abort, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprotocol -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getprotocol, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprotocol -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setprioceiling, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getstacksize -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/localtime, directory renamed /usr/src/debug/ltp/20230127-r0/t
 estcases/kernel/syscalls/lgetxattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/lgetxattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/listxattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/listxattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setstacksize -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_getpshared, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getgid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getgid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/lib -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/lib, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/syscall -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/syscall, directory renamed /usr/src/debug/ltp/20230127-r0/te
 stcases/network/sockets -> /usr/src/debug/ltp/20230516-r0/testcases/network/sockets, directory renamed /usr/src/debug/ltp/20230127-r0/include/old -> /usr/src/debug/ltp/20230516-r0/include/old, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mallopt -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mallopt, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getrusage -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getrusage, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pkeys -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pkeys, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_getclock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setspecific, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/timens -> /usr/src/debug/ltp/2023
 0516-r0/testcases/kernel/containers/timens, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/userns -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/userns, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/get_robust_list -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/get_robust_list, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/munlock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/munlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setclock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigpending, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/definitions/aio_h -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/definit
 ions/aio_h, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/swapping -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/swapping, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_unlock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_unlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedrdlock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_timedrdlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_getvalue -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_getvalue, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/clock -> /usr/src/debug/ltp/20230516-r0/
 testcases/open_posix_testsuite/conformance/interfaces/gmtime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mlock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/fs_di -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/fs_di, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_tryrdlock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mktime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/strlen -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedprio, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/cve -> /usr/src/debug/ltp/20230516-r0/testcases/cve, directory renamed /usr/src/debug/ltp/20
 230127-r0/testcases/kernel/syscalls/socketcall -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/socketcall, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_yield -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_yield, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_settime -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_settime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/removexattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/removexattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/ker
 nel/security/cap_bound -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/cap_bound, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/functional/mqueues -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/functional/mqueues, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/utime -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/utime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/fsx-linux -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/fsx-linux, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_error -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/renameat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/renameat, directory renamed /usr/src/debug/ltp/20230127-r0/t
 estcases/kernel/syscalls/inotify_init -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/inotify_init, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/numa -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/numa, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/lib -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/lib, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/set_thread_area -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/set_thread_area, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/filecaps -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/filecaps, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/memcg/functional -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/memcg/functional, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/recvfrom -> /usr/src/debug/ltp/20230516-r0/testcases/kerne
 l/syscalls/recvfrom, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/realpath -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/realpath, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fstatat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fstatat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/readlink -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/readlink, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/recvmmsg -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/recvmmsg, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuset/cpuset_memory_test -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuset/cpuset_memory_test, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setcancelstate -> /usr/src/debug/ltp/20230516-r0/testcase
 s/open_posix_testsuite/conformance/interfaces/pthread_key_create, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getegid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getegid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getrlimit -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getrlimit, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/fsync -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/fsync, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigdelset -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigdelset, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/math/nextafter -> /usr/src/debug/ltp/20230516-r0/testcases/misc/math/nextafter, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kern
 el/syscalls/gethostid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/gethostid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getresgid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getresgid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getresuid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getresuid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/input -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/input, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/utimensat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/utimensat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/stress/signals -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/stress/signals, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/epoll_wait -> /usr/src/debug/ltp/20230516-r0/testcases/
 kernel/syscalls/epoll_wait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/tbio/tbio_user -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/tbio/tbio_user, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/proc -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/proc, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_gettype/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_rdlock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_rdlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_unlock -> /usr/src/debug/ltp/20230516-r
 0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_unlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_wrlock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_error, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/definitions/errno_h -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/definitions/errno_h, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setpgrp -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setpgrp, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/definitions/sched_h -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/definitions/sched_h, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/fsstress -> /usr/src/debug/ltp/20230516-r0/testcases/
 kernel/fs/fsstress, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigrelse -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/msgrcv -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/msgrcv, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_fsync -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_fsync, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/tgkill -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/tgkill, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/reboot -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/reboot, directory renamed /usr/src/debug/ltp/20230127-r0/tools/genload -> /usr/src/debug/ltp/
 20230516-r0/tools/genload, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/munmap -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/munmap, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/lftest -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/lftest, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_init -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_init, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ioprio -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ioprio, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/stream -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/stream, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pread -> /usr/src/debug/ltp/2023051
 6-r0/testcases/kernel/syscalls/pread, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fspick -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fspick, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getpid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getpid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/vma -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/vma, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/string -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/string, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/logging/kmsg -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/logging/kmsg, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/shmget -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/shmget, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscall
 s/ipc/msgget -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/msgget, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuset/cpuset_syscall_test -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuset/cpuset_syscall_test, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/epoll_ctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/epoll_ctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/tkill -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/tkill, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/io_pgetevents -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/io_pgetevents, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/msync -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/msync, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/vhangup -> /usr/src/debug
 /ltp/20230516-r0/testcases/kernel/syscalls/vhangup, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/tracing/pt_test -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/tracing/pt_test, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/firmware/fw_load_user -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/firmware/fw_load_user, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/move_mount -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/move_mount, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sync -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sync, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/watchqueue -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/watchqueue, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_push -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/
 conformance/interfaces/pthread_getschedparam, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigqueue -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigqueue, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/clone3 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/clone3, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getcpuclockid/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_trywrlock/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigwait -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigwait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/tool -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/tool, directory renamed /usr/src/debug/ltp
 /20230127-r0/testcases/kernel/syscalls/accept -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/accept, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mknod -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mknod, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/request_key -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/request_key, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_getprioceiling -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_getprioceiling, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/nftw -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/nftw, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/statx -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/statx, directory renamed /usr/src/debu
 g/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_setprioceiling -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_self, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/send -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/send, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/clock_getres -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/clock_getres, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getpshared -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_getpshared, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_setpshared -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexatt
 r_setpshared, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_lock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_lock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sendto -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sendto, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/chroot -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/chroot, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/kill -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/kill, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/writev -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/writev, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fsmount -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fsmount, directo
 ry renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/execveat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/execveat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/unlinkat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/unlinkat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigtimedwait -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigtimedwait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_getres -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_getres, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_destroy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mlocka
 ll -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mlockall, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/mountns -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/mountns, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/umount -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/umount, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mallinfo -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mallinfo, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuset/cpuset_memory_spread_test, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/flock -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/flock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/thread_clock -> /usr/src/debug/ltp/
 20230516-r0/testcases/realtime/func/thread_clock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_broadcast, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_setschedprio -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/ctime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_post -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/killpg, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_destroy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_destroy, directory renamed /usr/src/debug/ltp/20
 230127-r0/testcases/kernel/controllers/io -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/io, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/faccessat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/faccessat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/futimesat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/futimesat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setns -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setns, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/math/float/bessel -> /usr/src/debug/ltp/20230516-r0/testcases/misc/math/float/bessel, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/epoll_pwait -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/epoll_pwait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/pidns -> /usr/src/debug/ltp/20230516-r0/t
 estcases/kernel/containers/pidns, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/prot_hsymlinks -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/prot_hsymlinks, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_nanosleep, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_unlink/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/signalfd4 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/signalfd4, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/memcg/regression -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/memcg/regression, direc
 tory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/ctime -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/definitions/mqueue_h, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_atfork, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/stat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/stat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sbrk -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sbrk, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/timer_create -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/timer_create, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/include -> /usr/src/debug/ltp/20230516-r0/testca
 ses/kernel/mem/include, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/timerfd -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/timerfd, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/readv -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/readv, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/ftest -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/ftest, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_init -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_getpshared, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/brk -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/brk, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_init -> /usr/src/debug/lt
 p/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_getspecific, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/difftime -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/getpid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/strftime -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/strftime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/exit -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/exit, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/doio/include -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/doio/include, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/lstat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/lstat, directory renamed /usr/src/debug/ltp/20230127-
 r0/testcases/open_posix_testsuite/conformance/interfaces/timer_create -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_create, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_delete -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getdetachstate, directory renamed /usr/src/debug/ltp/20230127-r0/utils/sctp/func_tests -> /usr/src/debug/ltp/20230516-r0/utils/sctp/func_tests, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rename -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/rename, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fadvise -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fadvise, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sendmsg -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sendmsg, directory 
 renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fallocate -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fallocate, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ftruncate -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ftruncate, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/access -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/access, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getgroups -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getgroups, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigaction -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigaction, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_gettime, directory ren
 amed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/userfaultfd -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/userfaultfd, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_settime -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_settime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fgetxattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fgetxattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fsetxattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fsetxattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_getaffinity -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_getaffinity, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/include -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/include, directory re
 named /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_setaffinity -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_setaffinity, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/poll -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/poll, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigset -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigset, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/squashfs -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/squashfs, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pwritev2 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pwritev2, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/geteuid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/geteuid, directory renamed /usr/src/debug/ltp/
 20230127-r0/testcases/kernel/controllers/pids -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/pids, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/signal -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/signal, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/memcpy -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/memcpy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mincore -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mincore, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_getattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_getattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_setattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_setattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/utils -> /usr/src/debug/ltp
 /20230516-r0/testcases/kernel/syscalls/utils, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_timedwait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/can/filter-tests -> /usr/src/debug/ltp/20230516-r0/testcases/network/can/filter-tests, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/sched/autogroup -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sched/autogroup, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/mqns -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/mqns, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/open_by_handle_at -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/open_by_handle_at, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/commands/ldd/datafiles -> /usr/src/debug/ltp/2
 0230516-r0/testcases/commands/ldd/datafiles, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/sched_jitter -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/sched_jitter, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_barrierattr_setpshared -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/clock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ioctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ioctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/read_all -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/read_all, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cancel, directory renamed /usr/src/debug/ltp/20230127-r0/test
 cases/open_posix_testsuite/conformance/interfaces/sched_getscheduler -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_getscheduler, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_setscheduler -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_setscheduler, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/inotify -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/inotify, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/behavior/WIFEXITED -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cleanup_pop, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_getschedpolicy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces
 /pthread_attr_getschedpolicy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_attr_setschedpolicy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/hrtimer-prio -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/hrtimer-prio, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/dirtyc0w -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/dirtyc0w, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/fs/doio -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/fs/doio, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_min -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_get_priority_min, directory renamed /usr/src/debug/lt
 p/20230127-r0/testcases/kernel/syscalls/getsockopt -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getsockopt, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_destroy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/behavior/timers, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/thp -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/thp, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/pathconf -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pathconf, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/munlockall -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_rr_get_interval/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/gtod_latency -> /usr/src/debug/ltp/20230516-r0/testc
 ases/realtime/func/gtod_latency, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/prio-preempt -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/prio-preempt, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/write -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/write, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/io_submit -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/io_submit, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/power_management -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/power_management, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/ipc/pipeio -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/ipc/pipeio, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/clock_settime/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/inte
 rfaces/clock_settime/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/nfsv4/locks -> /usr/src/debug/ltp/20230516-r0/testcases/network/nfsv4/locks, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/functional/timers/timers -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/functional/timers/timers, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/keyctl -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/keyctl, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/socketpair -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/socketpair, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/misc/math/float -> /usr/src/debug/ltp/20230516-r0/testcases/misc/math/float, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/kvm/include -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/kvm/include, directory renamed /usr/src/debug/ltp/
 20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/aio_cancel, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigpending -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigpending, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlockattr_setpshared -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/difftime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_init, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/io/writetest -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/io/writetest, directory renamed /usr/src/debug/ltp/20230127-r0/testcase
 s/kernel/syscalls/nanosleep -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/nanosleep, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/smack -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/smack, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/mq_getattr/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sched_getparam/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_create/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_signal -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_cond_signal, directory renamed /usr
 /src/debug/ltp/20230127-r0/testcases/realtime/func/sched_latency -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/sched_latency, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/clock_adjtime -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/clock_adjtime, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/realtime/func/periodic_cpu_load -> /usr/src/debug/ltp/20230516-r0/testcases/realtime/func/periodic_cpu_load, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/confstr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/confstr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_key_delete -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_setpshared, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/futex -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/sysc
 alls/futex, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getpagesize -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getpagesize, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugeshmget -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugeshmget, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mremap -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mremap, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/link -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/link, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/epoll_create1 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/epoll_create1, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/statfs -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/statfs, directory renamed /usr/src/debug/ltp/20230127-r0/te
 stcases/kernel/mem/ksm -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/ksm, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rt_sigsuspend -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/rt_sigsuspend, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/sysvipc -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/sysvipc, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/syncfs -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/syncfs, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/vfork -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/vfork, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_wait -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_wait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/confor
 mance/interfaces/timer_getoverrun -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_getoverrun, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mq_open -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mq_open, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/rmdir -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/rmdir, directory renamed /usr/src/debug/ltp/20230127-r0/libs/libltpipc -> /usr/src/debug/ltp/20230516-r0/libs/libltpipc, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cpuset/cpuset_memory_pressure_test, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/dirtypipe -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/security/dirtypipe, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_tests
 uite/conformance/interfaces/timer_getoverrun/speculative -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/timer_gettime/speculative, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_init -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_spin_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutexattr_destroy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_condattr_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/gettimeofday -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/gettimeofday, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/clone -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/clone, directory renamed /usr/src/debug/ltp
 /20230127-r0/testcases/kernel/syscalls/tee -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/tee, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/execle -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/execle, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_init -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_init, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigaltstack -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigaltstack, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fchown -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fchown, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/eventfd -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/eventfd, directory renamed /usr/src/debug/ltp/20230127
 -r0/testcases/kernel/syscalls/execlp -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/execlp, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_close -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sem_close, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sighold -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_wrlock, directory renamed /usr/src/debug/ltp/20230127-r0/utils/benchmark/ebizzy-0.3 -> /usr/src/debug/ltp/20230516-r0/utils/benchmark/ebizzy-0.3, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/freezer -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/freezer, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/io/aio -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/io/aio, directory renamed /usr/src/deb
 ug/ltp/20230127-r0/testcases/kernel/syscalls/pselect -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/pselect, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/network/nfs/nfs_stress -> /usr/src/debug/ltp/20230516-r0/testcases/network/nfs/nfs_stress, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mlock -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mlock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_trylock -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_mutex_trylock, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/rtc -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/rtc, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/wait4 -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/wait4, directory renamed /usr/src/debug/ltp/
 20230127-r0/testcases/kernel/syscalls/ipc/msgstress -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/msgstress, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/lseek -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/lseek, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mknodat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mknodat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/pty -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/pty, directory renamed /usr/src/debug/ltp/20230127-r0/libs/libltpsigwait -> /usr/src/debug/ltp/20230516-r0/libs/libltpsigwait, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_destroy -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_rwlock_destroy, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setgid ->
  /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setgid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/linkat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/linkat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sched_yield -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sched_yield, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigsuspend -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigsuspend, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/sigprocmask -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigprocmask, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/readlinkat -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/readlinkat, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conforman
 ce/interfaces/sigignore -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/sigignore, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setsid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setsid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/waitid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/waitid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_create -> /usr/src/debug/ltp/20230516-r0/testcases/open_posix_testsuite/conformance/interfaces/pthread_create, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setxattr -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setxattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/device-drivers/pci/tpci_kernel -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/device-drivers/pci/tpci_kernel, directory renamed 
 /usr/src/debug/ltp/20230127-r0/utils/sctp/lib -> /usr/src/debug/ltp/20230516-r0/utils/sctp/lib, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/listen -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/listen, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ssetmask -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ssetmask, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/setregid -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/setregid, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sigrelse -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sigrelse, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/sendmmsg -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/sendmmsg, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/flistxattr -> /usr/src/debug/ltp/20230516-r0/testcases/kerne
 l/syscalls/flistxattr, directory renamed /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/getpriority -> /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/getpriority, removed "/usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl35.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/tomoyo/include.h /usr/src/debug/ltp/20230127-r0/include/lapi/sem.h /usr/src/debug/ltp/20230127-r0/include/lapi/bpf.h /usr/src/debug/ltp/20230127-r0/include/lapi/kcmp.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap13.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap14.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap15.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/ipc/semaphore/sem01.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap16.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap17.c /usr/src/debug/ltp/20230127
 -r0/testcases/kernel/syscalls/madvise/madvise06.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap30.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap21.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap22.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl12.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl06.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl21.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl37.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_get_free_pids.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl04.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl14.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl18.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise09.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/
 syscalls/fcntl/fcntl27.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/semget/semget06.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount/mount06.c /usr/src/debug/ltp/20230127-r0/include/lapi/ustat.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/tomoyo/tomoyo_file_test.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_net_iface_prefix.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl08.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl10.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mprotect/mprotect04.c /usr/src/debug/ltp/20230127-r0/include/lapi/quotactl.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl23.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_kvcmp.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/ipc/semaphore/sem02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount/mount02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mm
 ap13.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl16.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise02.c /usr/src/debug/ltp/20230127-r0/include/lapi/fs.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl32.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/semop/semop.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap15.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl25.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap01.c /usr/src/debug/ltp/20230127-r0/include/lapi/futex.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/utsname/utstest.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap09.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl38.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap001.c /usr/src/d
 ebug/ltp/20230127-r0/testcases/kernel/controllers/cgroup/cgroup_core01.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cgroup/cgroup_core02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl13.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/semop/semop03.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap05.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl20.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_getconf.c /usr/src/debug/ltp/20230127-r0/include/lapi/epoll.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap03.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl15.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl22.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/semget/semget02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl26.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/tomoyo/tom
 oyo_policy_io_test.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_rod.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise08.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/semget/semget05.c /usr/src/debug/ltp/20230127-r0/include/lapi/membarrier.h /usr/src/debug/ltp/20230127-r0/include/lapi/openat2.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl11.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap26.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap27.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap28.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap29.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c /usr/sr
 c/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap05.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap06.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap07.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/share/ns_exec.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/share/ns_create.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_cgctl.c /usr/src/debug/ltp/20230127-r0/include/lapi/fsmount.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount/mount03.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl17.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/share/ns_common.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/tomoyo/newns.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/eventfd2/eventfd2_03.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl33.c /usr/src/debug/ltp/20230127-r0/testcases/kernel
 /syscalls/mq_notify/mq_notify02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl24.c /usr/src/debug/ltp/20230127-r0/include/lapi/common_timers.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount/mount01.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount/mount04.c /usr/src/debug/ltp/20230127-r0/include/lapi/io_pgetevents.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl31.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/eventfd2/eventfd2_01.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl19.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap18.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl36.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mprotect/mprotect03.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_net_vars.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap10.c /usr/src/debug/ltp/20230127-r0/testcases/ker
 nel/syscalls/fcntl/fcntl39.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap08.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_get_median.c /usr/src/debug/ltp/20230127-r0/include/lapi/io_uring.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap16.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_net_ip_prefix.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise10.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/semop/semop02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl_common.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap23.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap24.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap25.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fsconfig/fsconfig01.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap02.c /usr/src/debug/l
 tp/20230127-r0/testcases/kernel/syscalls/ipc/semget/semget03.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_timeout_kill.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl29.c /usr/src/debug/ltp/20230127-r0/include/lapi/init_module.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount/mount03_suid_child.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cgroup/cgroup_regression_getdelays.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_sleep.c /usr/src/debug/ltp/20230127-r0/include/lapi/rt_sigaction.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/semget/semget01.c /usr/src/debug/ltp/20230127-r0/include/lapi/watch_queue.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/eventfd2/eventfd2_02.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_get_unused_port.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/tomoyo/tomoyo_policy_memory_test.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mq_notify
 /mq_notify01.c /usr/src/debug/ltp/20230127-r0/include/lapi/safe_rt_signal.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/share/setns_check.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/ipc/semop/semop01.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mount/mount05.c /usr/src/debug/ltp/20230127-r0/include/lapi/readdir.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap07.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_hexdump.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_check_kconfigs.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fsconfig/fsconfig02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl34.c /usr/src/debug/ltp/20230127-r0/include/lapi/name_to_handle_at.h /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_check_drivers.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mprotect/mprotect02.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/tomoyo/tomoyo_filesystem_
 test.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl07.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap11.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl30.c /usr/src/debug/ltp/20230127-r0/include/lapi/ipcbuf.h /usr/src/debug/ltp/20230127-r0/include/lapi/msgbuf.h /usr/src/debug/ltp/20230127-r0/include/lapi/sembuf.h /usr/src/debug/ltp/20230127-r0/include/lapi/shmbuf.h /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_supported_fs.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/controllers/cgroup/cgroup_regression_fork_processes.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap17.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise07.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap19.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap11.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap12.c /usr/src/deb
 ug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap08.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap09.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap18.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap19.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap20.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap31.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap10.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_device.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/tomoyo/tomoyo_new_file_test.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/containers/share/ns_ifmove.c /usr/src/debug/ltp/20230127-r0/include/lapi/keyctl.h /usr/src/debug/ltp/20230127-r0/include/lapi/fanotify.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise01.c /usr/src/debug/ltp/20230127-
 r0/testcases/lib/tst_checkpoint.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl01.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl28.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl09.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise05.c /usr/src/debug/ltp/20230127-r0/include/lapi/pidfd.h /usr/src/debug/ltp/20230127-r0/include/lapi/sched.h /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl05.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/tomoyo/tomoyo_rewrite_test.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap06.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mprotect/mprotect01.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap12.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/security/tomoyo/tomoyo_accept_test.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/madvise/madvise03.c /usr/src/debug/ltp/20
 230127-r0/testcases/kernel/security/tomoyo/tomoyo_new_test.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap14.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/mmap/mmap04.c /usr/src/debug/ltp/20230127-r0/testcases/kernel/syscalls/fcntl/fcntl03.c /usr/src/debug/ltp/20230127-r0/testcases/lib/tst_random.c", added "/usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cgroup/cgroup_regression_getdelays.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl23.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap02.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap19.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mq_notify/mq_notify01.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mprotect/mprotect05.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl14.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl27.c /usr/src/debug/ltp/20230516-r0/inclu
 de/lapi/membarrier.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap17.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mq_notify/mq_notify03.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl12.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl36.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl21.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_ns_exec.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_hexdump.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_get_median.c /usr/src/debug/ltp/20230516-r0/include/lapi/io_pgetevents.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl30.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cgroup/cgroup_core01.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cgroup/cgroup_core02.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cgroup/cgroup_core03.c /usr/src/debug/ltp/20230516-r0/testcases/ke
 rnel/syscalls/mmap/mmap09.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap15.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/semget/semget02.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_check_drivers.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap001.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl38.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl34.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/madvise/madvise02.c /usr/src/debug/ltp/20230516-r0/include/lapi/fs.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl28.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap03.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl32.c /usr/src/debug/ltp/20230516-r0/include/lapi/openat2.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl22.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcn
 tl18.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_get_free_pids.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_device.c /usr/src/debug/ltp/20230516-r0/include/lapi/rt_sigaction.h /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_random.c /usr/src/debug/ltp/20230516-r0/include/lapi/futex.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl15.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_cgctl.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_ns_ifmove.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_fsfreeze.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap01.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mprotect/mprotect04.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mount/mount04.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/utsname/utsname02.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_get_unused_port.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl01.c /usr/
 src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl13.c /usr/src/debug/ltp/20230516-r0/include/lapi/fsmount.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap10.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/semop/semop03.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_net_ip_prefix.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap11.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl37.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap12.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap21.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap22.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl20.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap23.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mount/mount02.c /usr/src/debug/ltp/20230516-r0/te
 stcases/kernel/syscalls/ipc/semop/semop05.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap12.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl35.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl07.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl31.c /usr/src/debug/ltp/20230516-r0/include/lapi/quotactl.h /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_rod.c /usr/src/debug/ltp/20230516-r0/include/lapi/ustat.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap08.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl39.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl03.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fsconfig/fsconfig03.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/semget/semget01.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_net_vars.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/semop
 /semop01.c /usr/src/debug/ltp/20230516-r0/include/lapi/bpf.h /usr/src/debug/ltp/20230516-r0/include/lapi/sem.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap16.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap32.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap06.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/semget/semget05.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl16.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap07.c /usr/src/debug/ltp/20230516-r0/include/lapi/init_module.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap08.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl05.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap09.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap10.c /usr/src/debug/ltp/20230516-r0/include/l
 api/watch_queue.h /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_ns_common.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl25.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl33.c /usr/src/debug/ltp/20230516-r0/include/lapi/name_to_handle_at.h /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_kvcmp.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl10.c /usr/src/debug/ltp/20230516-r0/include/lapi/keyctl.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mount/mount01.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/controllers/cgroup/cgroup_regression_fork_processes.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl19.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/madvise/madvise09.c /usr/src/debug/ltp/20230516-r0/include/lapi/common_timers.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mprotect/mprotect03.c /usr/src/debug/ltp/20230516-r0/include/lapi/pidfd.h /usr/src/
 debug/ltp/20230516-r0/include/lapi/sched.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl_common.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/madvise/madvise01.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mprotect/mprotect01.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/semop/semop02.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_checkpoint.c /usr/src/debug/ltp/20230516-r0/include/lapi/io_uring.h /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_supported_fs.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/madvise/madvise07.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/utsname/utsname01.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/madvise/madvise10.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap11.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mount/mount03.c /usr/src/debug/ltp/20230516-r0/include/lapi/kcmp.h /usr/src/debug/ltp/20230516-r0/tes
 tcases/lib/tst_getconf.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_net_iface_prefix.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_sleep.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/semop/semop04.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap13.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl08.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_timeout_kill.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap17.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap18.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap19.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap20.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap24.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap01.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/h
 ugemmap02.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap04.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap05.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap13.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl02.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/utsname/utsname03.c /usr/src/debug/ltp/20230516-r0/include/lapi/safe_rt_signal.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/eventfd2/eventfd2_03.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fsconfig/fsconfig02.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl17.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap07.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl04.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl24.c /usr/src/debug/ltp/20230516-r0/include/lapi/fanotify.h /usr/src/debug/ltp/202
 30516-r0/include/lapi/readdir.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl09.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/eventfd2/eventfd2_01.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap20.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mount/mount06.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap05.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl11.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl26.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mprotect/mprotect02.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap18.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/madvise/madvise11.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fsconfig/fsconfig01.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap14.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hug
 emmap/hugemmap15.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap16.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap25.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap26.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap27.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap28.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap29.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap30.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/mem/hugetlb/hugemmap/hugemmap31.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/containers/utsname/utsname04.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/madvise/madvise06.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap14.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mq_notify/mq_notify02.c /usr/src/debug
 /ltp/20230516-r0/testcases/kernel/syscalls/madvise/madvise08.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/eventfd2/eventfd2.h /usr/src/debug/ltp/20230516-r0/include/lapi/epoll.h /usr/src/debug/ltp/20230516-r0/include/lapi/ipcbuf.h /usr/src/debug/ltp/20230516-r0/include/lapi/msgbuf.h /usr/src/debug/ltp/20230516-r0/include/lapi/sembuf.h /usr/src/debug/ltp/20230516-r0/include/lapi/close_range.h /usr/src/debug/ltp/20230516-r0/include/lapi/shmbuf.h /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_check_kconfigs.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/eventfd2/eventfd2_02.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/madvise/madvise03.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap06.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/fcntl/fcntl29.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mount/mount07.c /usr/src/debug/ltp/20230516-r0/testcases/lib/tst_ns_create.c /usr/src/debug/ltp/20230516-r0/tes
 tcases/kernel/syscalls/madvise/madvise05.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mount/mount03_suid_child.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mount/mount05.c /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/ipc/semop/semop.h /usr/src/debug/ltp/20230516-r0/testcases/kernel/syscalls/mmap/mmap04.c"
packages/core2-32-poky-linux/ltp/ltp-staticdev: PKGV changed from 20230127 [default] to 20230516 [default]
packages/core2-32-poky-linux/ltp/ltp-staticdev: PV changed from "20230127" to "20230516"
packages/core2-32-poky-linux/ltp/ltp: PKGV changed from 20230127 [default] to 20230516 [default]
packages/core2-32-poky-linux/ltp/ltp: PKGSIZE changed from 440379562 to 444975436 (+1%)
packages/core2-32-poky-linux/ltp/ltp: PV changed from "20230127" to "20230516"
packages/core2-32-poky-linux/ltp/ltp: FILELIST: removed "/opt/ltp/testcases/bin/tomoyo_policy_io_test /opt/ltp/testcases/bin/fcntl06 /opt/ltp/testcases/bin/ns_exec /opt/ltp/testcases/bin/tomoyo_file_test /opt/ltp/testcases/bin/runutstests_noltp.sh /opt/ltp/testcases/bin/tomoyo_new_file_test /opt/ltp/testcases/data/file01/in.csh /opt/ltp/testcases/bin/semget03 /opt/ltp/testcases/bin/tomoyo_accept_test /opt/ltp/testcases/bin/semget06 /opt/ltp/testcases/bin/ns_create /opt/ltp/testcases/data/file01/in.ksh /opt/ltp/testcases/bin/tomoyo_rewrite_test /opt/ltp/testcases/bin/tomoyo_new_test /opt/ltp/testcases/bin/newns /opt/ltp/testcases/bin/sem02 /opt/ltp/testcases/bin/sem01 /opt/ltp/testcases/bin/testall.sh /opt/ltp/bin/execltp /opt/ltp/testcases/bin/tomoyo_filesystem_test /opt/ltp/testcases/bin/tomoyo_policy_memory_test /opt/ltp/testcases/bin/utstest /opt/ltp/testcases/bin/setns_check /opt/ltp/testcases/bin/ns_ifmove /opt/ltp/testcases/bin/fcntl06_64", added "/opt/ltp/testcases/bin/nfs08.s
 h /opt/ltp/testcases/bin/tst_ns_exec /opt/ltp/testcases/bin/tst_ns_ifmove /opt/ltp/testcases/bin/kvm_svm01 /opt/ltp/testcases/bin/mprotect05 /opt/ltp/testcases/bin/tst_fsfreeze /opt/ltp/testcases/bin/fsconfig03 /opt/ltp/testcases/bin/tst_ns_create /opt/ltp/testcases/bin/cgroup_core03 /opt/ltp/testcases/bin/mmap20 /opt/ltp/testcases/bin/mq_notify03 /opt/ltp/testcases/bin/mount07 /opt/ltp/testcases/bin/hugemmap32 /opt/ltp/testcases/bin/madvise11 /opt/ltp/testcases/bin/utsname04 /opt/ltp/testcases/bin/utsname03 /opt/ltp/testcases/bin/utsname02 /opt/ltp/testcases/bin/utsname01 /opt/ltp/testcases/bin/semop04 /opt/ltp/testcases/bin/semop05"

--===============1068248349379527986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 53 skipped, 0 masked, 0 errors.
Removing 1 recipes from the cortexa15t2hf-neon sysroot...done.
Removing 1 recipes from the qemuarm sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:139957818288bcea346f96136ccee884fc495c23"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 127 Local 27 Mirrors 0 Missed 100 Current 726 (21% match, 88% complete)
Removing 1 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 736 of 853 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 853 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 759 of 853 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_create_spdx_setscene)
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 849 of 853 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/btrfs-tools/6.3-r0/temp/log.do_packagedata_setscene.3204160
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 850 of 853 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_package_setscene)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gawk/5.2.1-r0/temp/log.do_packagedata_setscene.3204367
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 851 of 853 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_setscene)
NOTE: Running task 1318 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_fetch)
NOTE: Running task 1539 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_fetch)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Started
NOTE: Running task 1618 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_validate_branches)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Succeeded
NOTE: Running task 1693 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_unpack)
NOTE: Running task 1694 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe btrfs-tools-6.3-r0: task do_package_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Started
NOTE: Running task 1753 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_fetch)
NOTE: Running task 1754 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_fetch)
NOTE: Running task 1755 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_fetch)
NOTE: Running task 1756 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_fetch)
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Started
NOTE: Running task 1834 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_fetch)
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1891 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_unpack)
NOTE: Running task 1892 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1908 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_populate_sysroot)
NOTE: Running task 1911 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_populate_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Started
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1955 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_fetch)
NOTE: recipe expect-5.45.4-r0: task do_fetch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_validate_branches: Started
NOTE: Running task 2018 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_fetch)
NOTE: Running task 2019 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: Running task 2020 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_fetch)
NOTE: Running task 2021 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_fetch)
NOTE: recipe gzip-1.12-r0: task do_fetch: Started
NOTE: recipe cpio-2.14-r0: task do_fetch: Started
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_fetch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_fetch: Succeeded
NOTE: Running task 2077 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_unpack)
NOTE: recipe cpio-2.14-r0: task do_fetch: Succeeded
NOTE: Running task 2089 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_unpack)
NOTE: Running task 2090 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_unpack)
NOTE: Running task 2091 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2092 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_unpack)
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2154 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2179 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_configure_ptest_base)
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_populate_sysroot: Started
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Started
NOTE: recipe ltp-20230516-r0: task do_fetch: Started
NOTE: Running task 2190 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_unpack)
NOTE: Running task 2191 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_prepare_recipe_sysroot)
NOTE: recipe net-tools-2.10-r0: task do_fetch: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: Running task 2217 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdb-13.1-r0: task do_fetch: Started
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 2236 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_patch)
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 2245 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_compile)
NOTE: Running task 2246 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: Running task 2256 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_unpack)
NOTE: Running task 2257 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdb-13.1-r0: task do_fetch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Started
NOTE: recipe gzip-1.12-r0: task do_unpack: Started
NOTE: recipe ltp-20230516-r0: task do_fetch: Succeeded
NOTE: Running task 2258 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_unpack)
NOTE: Running task 2259 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe expect-5.45.4-r0: task do_unpack: Started
NOTE: recipe cpio-2.14-r0: task do_unpack: Started
NOTE: Running task 2260 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_unpack)
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Started
NOTE: recipe net-tools-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 2349 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_unpack)
NOTE: Running task 2350 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_configure_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Succeeded
NOTE: recipe gzip-1.12-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 2436 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_patch)
NOTE: Running task 2437 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_patch)
NOTE: Running task 2438 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_collect_spdx_deps)
NOTE: recipe iproute2-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2446 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_collect_spdx_deps)
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_unpack: Succeeded
NOTE: recipe tar-1.34-r0: task do_compile: Started
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Started
NOTE: Running task 2447 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_patch)
NOTE: Running task 2448 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_patch)
NOTE: Running task 2449 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_collect_spdx_deps)
NOTE: recipe cpio-2.14-r0: task do_unpack: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffutils-3.9-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe ltp-20230516-r0: task do_unpack: Started
NOTE: recipe gdb-13.1-r0: task do_unpack: Started
NOTE: Running task 2450 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_patch)
NOTE: Running task 2453 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_collect_spdx_deps)
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Started
NOTE: recipe gdb-13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2454 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: Running task 2455 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_compile)
NOTE: recipe net-tools-2.10-r0: task do_unpack: Started
NOTE: Running task 2462 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_install)
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2472 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_patch)
NOTE: Running task 2477 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_collect_spdx_deps)
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2478 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_collect_spdx_deps)
NOTE: recipe tcl-8.6.13-r0: task do_patch: Started
NOTE: recipe tcl-8.6.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe gzip-1.12-r0: task do_patch: Started
NOTE: Running task 2479 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_collect_spdx_deps)
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_patch: Started
NOTE: Running task 2480 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: recipe cpio-2.14-r0: task do_patch: Started
NOTE: Running task 2481 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_collect_spdx_deps)
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2483 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_collect_spdx_deps)
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_collect_spdx_deps: Started
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe socat-1.7.4.4-r0: task do_install: Started
NOTE: Running task 2484 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_collect_spdx_deps)
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_collect_spdx_deps: Started
NOTE: recipe cronie-1.6.1-r0: task do_patch: Started
NOTE: recipe diffutils-3.9-r0: task do_compile: Started
NOTE: recipe iproute2-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe which-2.21-r3: task do_collect_spdx_deps: Started
NOTE: recipe gzip-1.12-r0: task do_patch: Succeeded
NOTE: Running task 2485 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2489 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_collect_spdx_deps)
NOTE: recipe gzip-1.12-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2490 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2491 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_configure)
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2495 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_populate_sysroot: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2496 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_create_spdx)
NOTE: recipe tcp-wrappers-7.6-r10: task do_collect_spdx_deps: Succeeded
NOTE: recipe gzip-1.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_collect_spdx_deps: Succeeded
NOTE: recipe which-2.21-r3: task do_collect_spdx_deps: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2497 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2498 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_validate_branches: Succeeded
NOTE: Running task 2499 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_patch)
NOTE: Running task 2500 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_collect_spdx_deps)
NOTE: Running task 2502 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_create_spdx)
NOTE: recipe cpio-2.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe cpio-2.14-r0: task do_patch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2503 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx)
NOTE: Running task 2504 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_metadata)
NOTE: Running task 2508 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2509 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2510 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2511 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe iproute2-6.3.0-r0: task do_configure: Started
NOTE: Running task 2513 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package_write_rpm)
NOTE: recipe logrotate-3.21.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata: Started
NOTE: Running task 2514 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_package_write_rpm)
NOTE: recipe iptables-1.8.9-r0: task do_create_spdx: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_create_spdx: Started
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cpio-2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_patch: Started
NOTE: recipe gdb-13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2515 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch)
NOTE: recipe libaio-0.3.113-r0: task do_collect_spdx_deps: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_create_spdx: Started
NOTE: recipe unzip-1_6.0-r5: task do_create_spdx: Started
NOTE: recipe bc-1.07.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_install: Succeeded
NOTE: Running task 2516 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_create_spdx)
NOTE: Running task 2519 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_kernel_metadata: Started
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2521 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_patch)
NOTE: Running task 2522 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2523 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_collect_spdx_deps)
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Started
NOTE: Running task 2524 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Started
NOTE: Running task 2525 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_package)
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Succeeded
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: Running task 2539 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: recipe net-tools-2.10-r0: task do_patch: Started
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: Running task 2540 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure)
NOTE: recipe net-tools-2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe curl-8.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2542 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata: Succeeded
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_patch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2543 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure)
NOTE: Running task 2544 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_configure)
NOTE: Running task 2545 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: recipe gzip-1.12-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_patch: Succeeded
NOTE: Running task 2546 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe ltp-20230516-r0: task do_unpack: Succeeded
NOTE: Running task 2547 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_patch)
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_patch: Succeeded
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe which-2.21-r3: task do_create_spdx: Succeeded
NOTE: Running task 2548 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_deploy_source_date_epoch)
NOTE: Running task 2549 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_configure)
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_create_spdx: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cpio-2.14-r0: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2550 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_compile)
NOTE: recipe expect-5.45.4-r0: task do_patch: Succeeded
NOTE: Running task 2551 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_deploy_source_date_epoch)
NOTE: recipe ltp-20230516-r0: task do_patch: Started
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_create_spdx: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_configure: Started
NOTE: recipe bc-1.07.1-r0: task do_create_spdx: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_compile: Started
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2552 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure)
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2553 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2555 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: Running task 2558 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm)
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2559 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_configure)
NOTE: recipe tcl-8.6.13-r0: task do_configure: Started
NOTE: recipe ltp-20230516-r0: task do_patch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_configure: Started
NOTE: Running task 2560 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_deploy_source_date_epoch)
NOTE: Running task 2561 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_populate_lic)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_configure: Started
NOTE: recipe ltp-20230516-r0: task do_populate_lic: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe ltp-20230516-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe net-tools-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2562 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Succeeded
NOTE: Running task 2563 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_compile)
NOTE: recipe libaio-0.3.113-r0: task do_configure: Succeeded
NOTE: Running task 2564 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_compile)
NOTE: recipe net-tools-2.10-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe ltp-20230516-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_populate_lic unihash changed to 6b88f8970844d4543941eefd5ce03a3931574075b4ac7e3e828876c02ba34b82
NOTE: recipe ltp-20230516-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_compile: Succeeded
NOTE: Running task 2565 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_install: Started
NOTE: recipe gdb-13.1-r0: task do_unpack: Succeeded
NOTE: Running task 2566 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_patch)
NOTE: Running task 2567 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_collect_spdx_deps)
NOTE: recipe gdb-13.1-r0: task do_patch: Started
NOTE: recipe libaio-0.3.113-r0: task do_install: Succeeded
NOTE: recipe gdb-13.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2568 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package)
NOTE: Running task 2569 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot)
NOTE: recipe libaio-0.3.113-r0: task do_package: Started
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Started
NOTE: recipe gdb-13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 2570 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_collect_spdx_deps)
NOTE: recipe iproute2-6.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe iproute2-6.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2571 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_prepare_recipe_sysroot)
NOTE: recipe ltp-20230516-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdb-13.1-r0: task do_patch: Succeeded
NOTE: Running task 2572 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ltp-20230516-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2573 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_configure)
NOTE: recipe gdb-13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_package: Succeeded
NOTE: recipe ltp-20230516-r0: task do_configure: Started
NOTE: Running task 2574 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_packagedata)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm unihash changed to 9dbbfbc23057223b723199cde4960fb7784a196cbf524db588965371ea6b2577
NOTE: recipe socat-1.7.4.4-r0: task do_packagedata: Started
NOTE: recipe gdb-13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2575 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_configure)
NOTE: recipe gdb-13.1-r0: task do_configure: Started
NOTE: recipe socat-1.7.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_kernel_metadata: Succeeded
NOTE: Running task 2576 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_patch)
NOTE: Running task 2577 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_version_sanity_check)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Succeeded
NOTE: Running task 2578 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Started
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Succeeded
NOTE: Running task 2579 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_create_spdx)
NOTE: Running task 2580 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm)
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Started
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx: Started
NOTE: recipe diffutils-3.9-r0: task do_compile: Succeeded
NOTE: Running task 2581 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_compile_ptest_base)
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_patch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_compile_ptest_base: Started
NOTE: Running task 2582 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_configme)
NOTE: Running task 2583 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe diffutils-3.9-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx: Succeeded
NOTE: Running task 2584 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_install)
NOTE: Running task 2585 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_collect_spdx_deps)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_kernel_configme: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffutils-3.9-r0: task do_install: Started
NOTE: recipe ltp-20230516-r0: task do_collect_spdx_deps: Started
NOTE: recipe ltp-20230516-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tar-1.34-r0: task do_compile: Succeeded
NOTE: Running task 2586 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_install)
NOTE: recipe tar-1.34-r0: task do_install: Started
NOTE: recipe gdb-13.1-r0: task do_configure: Succeeded
NOTE: Running task 2587 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_compile)
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Succeeded
NOTE: Running task 2588 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure_ptest_base)
NOTE: recipe gdb-13.1-r0: task do_compile: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2589 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2590 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Started
NOTE: recipe diffutils-3.9-r0: task do_install: Succeeded
NOTE: Running task 2591 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe diffutils-3.9-r0: task do_install_ptest_base: Started
NOTE: recipe diffutils-3.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2592 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_package)
NOTE: recipe diffutils-3.9-r0: task do_package: Started
NOTE: recipe tar-1.34-r0: task do_install: Succeeded
NOTE: Running task 2593 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package)
NOTE: recipe tar-1.34-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2594 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe curl-8.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe cronie-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2595 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_compile)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Succeeded
NOTE: Running task 2596 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2597 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2598 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe cronie-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2599 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_install: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2600 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2601 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe logrotate-3.21.0-r0: task do_install: Succeeded
NOTE: Running task 2602 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2603 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile)
NOTE: recipe cronie-1.6.1-r0: task do_install: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Started
NOTE: Running task 2604 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Started
NOTE: recipe cronie-1.6.1-r0: task do_package: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2605 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package)
NOTE: recipe net-tools-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2606 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_install)
NOTE: recipe logrotate-3.21.0-r0: task do_package: Started
NOTE: recipe net-tools-2.10-r0: task do_install: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2607 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure_ptest_base)
NOTE: recipe net-tools-2.10-r0: task do_install: Succeeded
NOTE: Running task 2608 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package)
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2609 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile)
NOTE: recipe net-tools-2.10-r0: task do_package: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile: Started
NOTE: recipe cronie-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2610 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata)
NOTE: recipe diffutils-3.9-r0: task do_package: Succeeded
NOTE: recipe tar-1.34-r0: task do_package: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Started
NOTE: Running task 2611 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_packagedata)
NOTE: Running task 2612 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata)
NOTE: recipe iproute2-6.3.0-r0: task do_compile: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_packagedata: Started
NOTE: Running task 2613 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_install)
NOTE: recipe tar-1.34-r0: task do_packagedata: Started
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2614 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_create_spdx)
NOTE: Running task 2615 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package_write_rpm)
NOTE: recipe iproute2-6.3.0-r0: task do_install: Started
NOTE: recipe cronie-1.6.1-r0: task do_create_spdx: Started
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe tar-1.34-r0: task do_packagedata: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_packagedata: Succeeded
NOTE: Running task 2616 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_create_spdx)
NOTE: Running task 2617 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_rpm)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2618 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile_ptest_base)
NOTE: Running task 2619 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm)
NOTE: recipe cronie-1.6.1-r0: task do_create_spdx: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_install: Succeeded
NOTE: recipe tar-1.34-r0: task do_create_spdx: Started
NOTE: Running task 2620 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_package)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-6.3.0-r0: task do_package: Started
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package: Succeeded
NOTE: recipe tar-1.34-r0: task do_create_spdx: Succeeded
NOTE: Running task 2621 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_packagedata)
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2622 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2623 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install)
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2624 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_create_spdx)
NOTE: Running task 2625 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe net-tools-2.10-r0: task do_create_spdx: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_create_spdx: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_package: Succeeded
NOTE: Running task 2626 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_packagedata)
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Started
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2627 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_create_spdx)
NOTE: Running task 2628 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package_write_rpm)
NOTE: recipe logrotate-3.21.0-r0: task do_create_spdx: Started
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_create_spdx: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_package: Succeeded
NOTE: Running task 2629 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_packagedata)
NOTE: recipe iproute2-6.3.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2630 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_create_spdx)
NOTE: recipe tcl-8.6.13-r0: task do_compile: Succeeded
NOTE: Running task 2631 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_package_write_rpm)
NOTE: Running task 2632 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile_ptest_base)
NOTE: recipe iproute2-6.3.0-r0: task do_create_spdx: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Started
NOTE: recipe iproute2-6.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-6.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Succeeded
NOTE: Running task 2633 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2634 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_install)
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_install: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2635 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_package)
NOTE: Running task 2636 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_populate_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2637 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_prepare_recipe_sysroot)
NOTE: recipe quota-4.09-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_kernel_configme: Succeeded
NOTE: Running task 2638 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_configure)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_configure: Started
NOTE: recipe gzip-1.12-r0: task do_configure: Succeeded
NOTE: Running task 2639 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure_ptest_base)
NOTE: recipe iproute2-6.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe quota-4.09-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gzip-1.12-r0: task do_configure_ptest_base: Started
NOTE: Running task 2640 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_configure)
NOTE: recipe gzip-1.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2641 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_compile)
NOTE: recipe quota-4.09-r0: task do_configure: Started
NOTE: recipe gzip-1.12-r0: task do_compile: Started
NOTE: recipe gzip-1.12-r0: task do_compile: Succeeded
NOTE: Running task 2642 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_compile_ptest_base)
NOTE: recipe gzip-1.12-r0: task do_compile_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2643 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_install)
NOTE: recipe gzip-1.12-r0: task do_install: Started
NOTE: recipe gzip-1.12-r0: task do_install: Succeeded
NOTE: Running task 2644 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_install_ptest_base)
NOTE: recipe ltp-20230516-r0: task do_configure: Succeeded
NOTE: Running task 2645 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_compile)
NOTE: recipe ltp-20230516-r0: task do_compile: Started
NOTE: recipe gzip-1.12-r0: task do_install_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2646 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_package)
NOTE: recipe gzip-1.12-r0: task do_package: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_configure: Succeeded
NOTE: Running task 2647 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_configcheck)
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_kernel_configcheck: Started
NOTE: Running task 2648 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2649 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_create_spdx)
NOTE: recipe libnl-1_3.7.0-r0: task do_create_spdx: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2650 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_collect_spdx_deps)
NOTE: recipe quota-4.09-r0: task do_collect_spdx_deps: Started
NOTE: recipe gzip-1.12-r0: task do_package: Succeeded
NOTE: recipe quota-4.09-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2651 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_packagedata)
NOTE: recipe gzip-1.12-r0: task do_packagedata: Started
NOTE: recipe quota-4.09-r0: task do_configure: Succeeded
NOTE: Running task 2652 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_compile)
NOTE: recipe gzip-1.12-r0: task do_packagedata: Succeeded
NOTE: Running task 2653 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_create_spdx)
NOTE: recipe tcl-8.6.13-r0: task do_install: Succeeded
NOTE: Running task 2654 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_package_write_rpm)
NOTE: Running task 2655 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_install_ptest_base)
NOTE: recipe quota-4.09-r0: task do_compile: Started
NOTE: recipe gzip-1.12-r0: task do_create_spdx: Started
NOTE: recipe gzip-1.12-r0: task do_package_write_rpm: Started
NOTE: recipe tcl-8.6.13-r0: task do_install_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2656 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_populate_sysroot)
NOTE: Running task 2657 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_package)
NOTE: recipe gzip-1.12-r0: task do_create_spdx: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_populate_sysroot: Started
NOTE: recipe tcl-8.6.13-r0: task do_package: Started
NOTE: recipe quota-4.09-r0: task do_compile: Succeeded
NOTE: Running task 2658 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_install)
NOTE: recipe quota-4.09-r0: task do_install: Started
NOTE: recipe gzip-1.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cpio-2.14-r0: task do_configure: Succeeded
NOTE: Running task 2659 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_configure_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2660 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe cpio-2.14-r0: task do_configure_ptest_base: Started
NOTE: recipe quota-4.09-r0: task do_install: Succeeded
NOTE: Running task 2661 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_package)
NOTE: recipe expect-5.45.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cpio-2.14-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2662 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_compile)
NOTE: recipe quota-4.09-r0: task do_package: Started
NOTE: recipe cpio-2.14-r0: task do_compile: Started
NOTE: recipe expect-5.45.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2663 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_configure)
NOTE: recipe expect-5.45.4-r0: task do_configure: Started
NOTE: recipe cpio-2.14-r0: task do_compile: Succeeded
NOTE: Running task 2664 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_compile_ptest_base)
NOTE: recipe cpio-2.14-r0: task do_compile_ptest_base: Started
NOTE: recipe cpio-2.14-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2665 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_install)
NOTE: recipe cpio-2.14-r0: task do_install: Started
NOTE: recipe quota-4.09-r0: task do_package: Succeeded
NOTE: Running task 2666 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_packagedata)
NOTE: recipe quota-4.09-r0: task do_packagedata: Started
NOTE: recipe quota-4.09-r0: task do_packagedata: Succeeded
NOTE: Running task 2667 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_create_spdx)
NOTE: Running task 2668 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_package_write_rpm)
NOTE: recipe quota-4.09-r0: task do_create_spdx: Started
NOTE: recipe quota-4.09-r0: task do_package_write_rpm: Started
NOTE: recipe cpio-2.14-r0: task do_install: Succeeded
NOTE: Running task 2669 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_install_ptest_base)
NOTE: recipe cpio-2.14-r0: task do_install_ptest_base: Started
NOTE: recipe cpio-2.14-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2670 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_package)
NOTE: recipe cpio-2.14-r0: task do_package: Started
NOTE: recipe quota-4.09-r0: task do_create_spdx: Succeeded
NOTE: recipe quota-4.09-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_kernel_configcheck: Succeeded
NOTE: Running task 2671 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_compile)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_compile: Started
NOTE: recipe tcl-8.6.13-r0: task do_package: Succeeded
NOTE: Running task 2672 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_packagedata)
NOTE: recipe tcl-8.6.13-r0: task do_packagedata: Started
NOTE: recipe cpio-2.14-r0: task do_package: Succeeded
NOTE: Running task 2673 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_packagedata)
NOTE: recipe cpio-2.14-r0: task do_packagedata: Started
NOTE: recipe tcl-8.6.13-r0: task do_packagedata: Succeeded
NOTE: Running task 2674 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_create_spdx)
NOTE: recipe tcl-8.6.13-r0: task do_create_spdx: Started
NOTE: recipe cpio-2.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2675 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_create_spdx)
NOTE: Running task 2676 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_package_write_rpm)
NOTE: recipe cpio-2.14-r0: task do_create_spdx: Started
NOTE: recipe cpio-2.14-r0: task do_package_write_rpm: Started
NOTE: recipe cpio-2.14-r0: task do_create_spdx: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_create_spdx: Succeeded
NOTE: Running task 2677 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_collect_spdx_deps)
NOTE: recipe expect-5.45.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe expect-5.45.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_configure: Succeeded
NOTE: Running task 2678 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_configure_ptest_base)
NOTE: recipe expect-5.45.4-r0: task do_configure_ptest_base: Started
NOTE: recipe expect-5.45.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2679 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_compile)
NOTE: recipe expect-5.45.4-r0: task do_compile: Started
NOTE: recipe cpio-2.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_compile: Succeeded
NOTE: Running task 2680 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_compile_ptest_base)
NOTE: recipe expect-5.45.4-r0: task do_compile_ptest_base: Started
NOTE: recipe expect-5.45.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2681 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_install)
NOTE: recipe expect-5.45.4-r0: task do_install: Started
NOTE: recipe expect-5.45.4-r0: task do_install: Succeeded
NOTE: Running task 2682 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_install_ptest_base)
NOTE: recipe expect-5.45.4-r0: task do_install_ptest_base: Started
NOTE: recipe expect-5.45.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2683 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package)
NOTE: recipe expect-5.45.4-r0: task do_package: Started
NOTE: recipe expect-5.45.4-r0: task do_package: Succeeded
NOTE: Running task 2684 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_packagedata)
NOTE: recipe expect-5.45.4-r0: task do_packagedata: Started
NOTE: recipe expect-5.45.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2685 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_create_spdx)
NOTE: Running task 2686 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_rpm)
NOTE: recipe expect-5.45.4-r0: task do_create_spdx: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm: Started
NOTE: recipe expect-5.45.4-r0: task do_create_spdx: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_compile: Succeeded
NOTE: Running task 2687 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_shared_workdir)
NOTE: Running task 2688 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_link_images)
NOTE: Running task 2689 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_transform_kernel)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_shared_workdir: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_kernel_link_images: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_transform_kernel: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_kernel_link_images: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_transform_kernel: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_shared_workdir: Succeeded
NOTE: Running task 2690 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_compile_kernelmodules)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_compile_kernelmodules: Started
NOTE: recipe gdb-13.1-r0: task do_compile: Succeeded
NOTE: Running task 2691 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_install)
NOTE: recipe gdb-13.1-r0: task do_install: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_compile_kernelmodules: Succeeded
NOTE: Running task 2692 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_strip)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_strip: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_strip: Succeeded
NOTE: Running task 2693 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_sizecheck)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_sizecheck: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_sizecheck: Succeeded
NOTE: Running task 2694 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_install)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_install: Started
NOTE: recipe gdb-13.1-r0: task do_install: Succeeded
NOTE: Running task 2695 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_package)
NOTE: recipe gdb-13.1-r0: task do_package: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_install: Succeeded
NOTE: Running task 2696 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_package)
NOTE: Running task 2697 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_bundle_initramfs)
NOTE: Running task 2698 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_populate_sysroot)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_package: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_bundle_initramfs: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_populate_sysroot: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_bundle_initramfs: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdb-13.1-r0: task do_package: Succeeded
NOTE: Running task 2699 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_packagedata)
NOTE: recipe gdb-13.1-r0: task do_packagedata: Started
NOTE: recipe gdb-13.1-r0: task do_packagedata: Failed
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_a362b0a227-r0: task do_package: Succeeded
NOTE: recipe ltp-20230516-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2699 tasks of which 2456 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 47 ERROR messages, returning a non-zero exit code.
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-src went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dbg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-ptest went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-gawkbug went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-staticdev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-doc went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-bg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ca went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-da went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-de went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-es went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fi went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fr went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-id went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-it went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ja went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ko went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ms went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-nl went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pl went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pt went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pt-br went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ro went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-sr went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-sv went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-vi went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-zh-cn went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-src went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-dbg went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdbserver went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-staticdev went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-dev went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-doc went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-locale went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/gdb/13.1-r0/temp/log.do_packagedata.3462092
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_packagedata) failed with exit code '1'

--===============1068248349379527986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 69 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:139957818288bcea346f96136ccee884fc495c23"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 126 Local 27 Mirrors 0 Missed 99 Current 727 (21% match, 88% complete)
Removing 1 stale sstate objects for arch ppc7400...done.
NOTE: Executing Tasks
NOTE: Running setscene task 736 of 853 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 853 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 759 of 853 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_create_spdx_setscene)
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 849 of 853 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/btrfs-tools/6.3-r0/temp/log.do_packagedata_setscene.3988759
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 850 of 853 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_package_setscene)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gawk/5.2.1-r0/temp/log.do_packagedata_setscene.3988966
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 851 of 853 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_setscene)
NOTE: Running task 1319 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_fetch)
NOTE: Running task 1540 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_fetch)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_package_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Started
NOTE: Running task 1618 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_validate_branches)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Succeeded
NOTE: Running task 1646 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_unpack)
NOTE: Running task 1647 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1753 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_fetch)
NOTE: Running task 1754 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_fetch)
NOTE: Running task 1755 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_fetch)
NOTE: Running task 1756 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_fetch)
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Succeeded
NOTE: Running task 1834 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_fetch)
NOTE: Running task 1841 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_unpack)
NOTE: Running task 1842 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Started
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1908 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_populate_sysroot)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_validate_branches: Started
NOTE: Running task 1911 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_populate_sysroot)
NOTE: recipe gzip-1.12-r0: task do_fetch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Started
NOTE: Running task 1955 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_fetch)
NOTE: recipe cpio-2.14-r0: task do_fetch: Started
NOTE: recipe expect-5.45.4-r0: task do_fetch: Started
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_fetch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_fetch: Succeeded
NOTE: Running task 2011 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_unpack)
NOTE: Running task 2012 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_unpack)
NOTE: Running task 2013 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe expect-5.45.4-r0: task do_fetch: Succeeded
NOTE: Running task 2014 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_unpack)
NOTE: Running task 2022 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: Running task 2023 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_fetch)
NOTE: Running task 2024 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_fetch)
NOTE: Running task 2025 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_fetch)
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2042 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_populate_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Succeeded
NOTE: Running task 2130 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_unpack)
NOTE: Running task 2131 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_prepare_recipe_sysroot)
NOTE: recipe ltp-20230516-r0: task do_fetch: Started
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Started
NOTE: Running task 2156 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Succeeded
NOTE: Running task 2157 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_patch)
NOTE: Running task 2182 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_configure_ptest_base)
NOTE: recipe gzip-1.12-r0: task do_unpack: Started
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cpio-2.14-r0: task do_unpack: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Started
NOTE: recipe net-tools-2.10-r0: task do_fetch: Started
NOTE: recipe gdb-13.1-r0: task do_fetch: Started
NOTE: recipe expect-5.45.4-r0: task do_unpack: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: Running task 2201 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: recipe btrfs-tools-6.3-r0: task do_package_setscene: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Succeeded
NOTE: Running task 2218 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdb-13.1-r0: task do_fetch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Started
NOTE: recipe ltp-20230516-r0: task do_fetch: Succeeded
NOTE: Running task 2219 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_unpack)
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Started
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2220 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_unpack)
NOTE: Running task 2221 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_unpack)
NOTE: Running task 2245 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2246 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe net-tools-2.10-r0: task do_fetch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_unpack: Succeeded
NOTE: Running task 2247 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_patch)
NOTE: Running task 2248 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_unpack)
NOTE: Running task 2249 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2254 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_compile)
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Started
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Succeeded
NOTE: recipe cpio-2.14-r0: task do_unpack: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_unpack: Succeeded
NOTE: Running task 2297 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_patch)
NOTE: Running task 2298 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_patch)
NOTE: recipe diffutils-3.9-r0: task do_configure_ptest_base: Started
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: Running task 2312 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_patch)
NOTE: recipe iproute2-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Succeeded
NOTE: recipe ltp-20230516-r0: task do_unpack: Started
NOTE: recipe gdb-13.1-r0: task do_unpack: Started
NOTE: Running task 2394 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_patch)
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Started
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2428 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2450 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_collect_spdx_deps)
NOTE: recipe diffutils-3.9-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe gdb-13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Started
NOTE: Running task 2451 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_collect_spdx_deps)
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gzip-1.12-r0: task do_patch: Started
NOTE: recipe tar-1.34-r0: task do_compile: Started
NOTE: Running task 2452 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_compile)
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2454 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_collect_spdx_deps)
NOTE: recipe tcl-8.6.13-r0: task do_patch: Started
NOTE: Running task 2455 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2456 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_patch)
NOTE: Running task 2459 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_collect_spdx_deps)
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cpio-2.14-r0: task do_patch: Started
NOTE: recipe expect-5.45.4-r0: task do_patch: Started
NOTE: Running task 2479 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_collect_spdx_deps)
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2480 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_collect_spdx_deps)
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Started
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: Running task 2482 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_collect_spdx_deps)
NOTE: recipe tcp-wrappers-7.6-r10: task do_collect_spdx_deps: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2483 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_collect_spdx_deps)
NOTE: recipe diffutils-3.9-r0: task do_compile: Started
NOTE: Running task 2485 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_collect_spdx_deps)
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe cronie-1.6.1-r0: task do_patch: Started
NOTE: Running task 2486 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2487 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_collect_spdx_deps)
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gzip-1.12-r0: task do_patch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_collect_spdx_deps: Succeeded
NOTE: recipe which-2.21-r3: task do_collect_spdx_deps: Started
NOTE: Running task 2488 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2489 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_collect_spdx_deps)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_validate_branches: Succeeded
NOTE: recipe gzip-1.12-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2490 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx)
NOTE: recipe cpio-2.14-r0: task do_patch: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_populate_sysroot: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2491 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_metadata)
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2492 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2493 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Succeeded
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: Running task 2494 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_create_spdx)
NOTE: recipe which-2.21-r3: task do_collect_spdx_deps: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cpio-2.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2495 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_patch)
NOTE: Running task 2496 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch)
NOTE: Running task 2497 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_collect_spdx_deps)
NOTE: recipe gzip-1.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe iproute2-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2504 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata)
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_collect_spdx_deps: Started
NOTE: Running task 2505 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_create_spdx: Started
NOTE: Running task 2506 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_packagedata)
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2507 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_create_spdx)
NOTE: recipe cpio-2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libaio-0.3.113-r0: task do_patch: Started
NOTE: Running task 2509 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iptables-1.8.9-r0: task do_create_spdx: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_kernel_metadata: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2512 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: Running task 2513 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_package_write_rpm)
NOTE: recipe gdb-13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libaio-0.3.113-r0: task do_collect_spdx_deps: Started
NOTE: recipe logrotate-3.21.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2514 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure)
NOTE: Running task 2518 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: Running task 2519 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package_write_rpm)
NOTE: recipe net-tools-2.10-r0: task do_unpack: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_collect_spdx_deps: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata: Started
NOTE: Running task 2520 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_patch)
NOTE: recipe iproute2-6.3.0-r0: task do_configure: Started
NOTE: recipe libaio-0.3.113-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2521 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_collect_spdx_deps)
NOTE: recipe socat-1.7.4.4-r0: task do_packagedata: Started
NOTE: recipe which-2.21-r3: task do_create_spdx: Started
NOTE: Running task 2522 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_create_spdx)
NOTE: Running task 2523 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx)
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2524 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Started
NOTE: recipe net-tools-2.10-r0: task do_patch: Started
NOTE: Running task 2527 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe curl-8.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Started
NOTE: Running task 2528 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure)
NOTE: recipe bc-1.07.1-r0: task do_create_spdx: Started
NOTE: recipe unzip-1_6.0-r5: task do_create_spdx: Started
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Started
NOTE: recipe net-tools-2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gzip-1.12-r0: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_patch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_patch: Succeeded
NOTE: Running task 2529 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_deploy_source_date_epoch)
NOTE: Running task 2530 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2531 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure)
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2532 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2533 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe socat-1.7.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libaio-0.3.113-r0: task do_patch: Succeeded
NOTE: Running task 2546 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20230516-r0: task do_unpack: Succeeded
NOTE: Running task 2547 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_deploy_source_date_epoch)
NOTE: Running task 2549 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_patch)
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2550 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_configure)
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Started
NOTE: recipe cpio-2.14-r0: task do_configure: Started
NOTE: recipe expect-5.45.4-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_create_spdx: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2551 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe ltp-20230516-r0: task do_patch: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.3.0-r0: task do_configure: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_configure: Started
NOTE: Running task 2552 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_create_spdx: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2553 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_configure)
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2554 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure)
NOTE: recipe bc-1.07.1-r0: task do_create_spdx: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_create_spdx: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_compile: Started
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_configure: Started
NOTE: Running task 2555 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_configure)
NOTE: recipe tcl-8.6.13-r0: task do_configure: Started
NOTE: recipe libaio-0.3.113-r0: task do_configure: Started
NOTE: recipe ltp-20230516-r0: task do_patch: Succeeded
NOTE: Running task 2556 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_deploy_source_date_epoch)
NOTE: Running task 2557 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_populate_lic)
NOTE: recipe net-tools-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2558 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_compile)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2562 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm)
NOTE: Running task 2563 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe libaio-0.3.113-r0: task do_configure: Succeeded
NOTE: recipe ltp-20230516-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2564 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_compile)
NOTE: recipe ltp-20230516-r0: task do_populate_lic: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libaio-0.3.113-r0: task do_compile: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe ltp-20230516-r0: task do_populate_lic: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_populate_lic unihash changed to 6b88f8970844d4543941eefd5ce03a3931574075b4ac7e3e828876c02ba34b82
NOTE: Running task 2565 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe ltp-20230516-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_compile: Succeeded
NOTE: Running task 2566 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_install: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_install: Succeeded
NOTE: Running task 2567 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package)
NOTE: Running task 2568 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot)
NOTE: recipe gdb-13.1-r0: task do_unpack: Succeeded
NOTE: Running task 2569 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_patch)
NOTE: Running task 2570 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_collect_spdx_deps)
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Started
NOTE: recipe gdb-13.1-r0: task do_patch: Started
NOTE: recipe gdb-13.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdb-13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 2571 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_collect_spdx_deps)
NOTE: recipe iproute2-6.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe iproute2-6.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gdb-13.1-r0: task do_patch: Succeeded
NOTE: Running task 2572 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gdb-13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2573 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_prepare_recipe_sysroot)
NOTE: recipe gdb-13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2574 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_configure)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm unihash changed to f265d7902d51e20fdf00a311bf3e7892c41797afa6adf57c36ae99f090b3577c
NOTE: recipe ltp-20230516-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdb-13.1-r0: task do_configure: Started
NOTE: recipe ltp-20230516-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2575 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_configure)
NOTE: recipe ltp-20230516-r0: task do_configure: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_kernel_metadata: Succeeded
NOTE: Running task 2576 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata)
NOTE: Running task 2577 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_patch)
NOTE: Running task 2578 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_version_sanity_check)
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Succeeded
NOTE: Running task 2579 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_create_spdx)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: Running task 2580 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm)
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Started
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx: Succeeded
NOTE: Running task 2581 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_collect_spdx_deps)
NOTE: recipe ltp-20230516-r0: task do_collect_spdx_deps: Started
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ltp-20230516-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_patch: Succeeded
NOTE: Running task 2582 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_configme)
NOTE: Running task 2583 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe diffutils-3.9-r0: task do_compile: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_kernel_configme: Started
NOTE: Running task 2584 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_compile_ptest_base)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_compile_ptest_base: Started
NOTE: recipe diffutils-3.9-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2585 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_install)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_install: Started
NOTE: recipe tar-1.34-r0: task do_compile: Succeeded
NOTE: Running task 2586 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_install)
NOTE: recipe gdb-13.1-r0: task do_configure: Succeeded
NOTE: Running task 2587 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_compile)
NOTE: recipe tar-1.34-r0: task do_install: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Succeeded
NOTE: Running task 2588 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure_ptest_base)
NOTE: recipe gdb-13.1-r0: task do_compile: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2589 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile)
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2590 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe diffutils-3.9-r0: task do_install: Succeeded
NOTE: Running task 2591 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_install_ptest_base)
NOTE: recipe diffutils-3.9-r0: task do_install_ptest_base: Started
NOTE: recipe diffutils-3.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2592 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_package)
NOTE: recipe diffutils-3.9-r0: task do_package: Started
NOTE: recipe cronie-1.6.1-r0: task do_configure: Succeeded
NOTE: Running task 2593 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2594 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe curl-8.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe tar-1.34-r0: task do_install: Succeeded
NOTE: Running task 2595 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package)
NOTE: recipe tar-1.34-r0: task do_package: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Succeeded
NOTE: Running task 2596 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe cronie-1.6.1-r0: task do_compile: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2597 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install)
NOTE: Running task 2598 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_install: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2599 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe cronie-1.6.1-r0: task do_install: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_install: Succeeded
NOTE: Running task 2600 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package)
NOTE: Running task 2601 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install_ptest_base)
NOTE: recipe cronie-1.6.1-r0: task do_package: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2602 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2603 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2604 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2605 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile)
NOTE: recipe net-tools-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2606 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_install)
NOTE: recipe logrotate-3.21.0-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Started
NOTE: recipe net-tools-2.10-r0: task do_install: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2607 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2608 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile)
NOTE: recipe tcl-8.6.13-r0: task do_compile: Started
NOTE: recipe net-tools-2.10-r0: task do_install: Succeeded
NOTE: Running task 2609 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package)
NOTE: recipe net-tools-2.10-r0: task do_package: Started
NOTE: recipe iproute2-6.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2610 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2611 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata)
NOTE: recipe iproute2-6.3.0-r0: task do_install: Started
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Started
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2612 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_create_spdx)
NOTE: Running task 2613 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package_write_rpm)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2614 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile_ptest_base)
NOTE: recipe cronie-1.6.1-r0: task do_create_spdx: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Started
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-6.3.0-r0: task do_install: Succeeded
NOTE: Running task 2615 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_package)
NOTE: recipe iproute2-6.3.0-r0: task do_package: Started
NOTE: recipe cronie-1.6.1-r0: task do_create_spdx: Succeeded
NOTE: recipe tar-1.34-r0: task do_package: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_package: Succeeded
NOTE: Running task 2616 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata)
NOTE: Running task 2617 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_packagedata)
NOTE: recipe tar-1.34-r0: task do_packagedata: Started
NOTE: recipe diffutils-3.9-r0: task do_packagedata: Started
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_packagedata: Succeeded
NOTE: Running task 2618 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_create_spdx)
NOTE: Running task 2619 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_rpm)
NOTE: Running task 2620 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm)
NOTE: recipe tar-1.34-r0: task do_create_spdx: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2621 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Started
NOTE: Running task 2622 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe net-tools-2.10-r0: task do_package: Succeeded
NOTE: Running task 2623 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Started
NOTE: recipe tar-1.34-r0: task do_create_spdx: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2624 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_create_spdx)
NOTE: Running task 2625 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_rpm)
NOTE: recipe logrotate-3.21.0-r0: task do_package: Succeeded
NOTE: Running task 2626 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_packagedata)
NOTE: recipe net-tools-2.10-r0: task do_create_spdx: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Started
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2627 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_create_spdx)
NOTE: Running task 2628 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package_write_rpm)
NOTE: recipe logrotate-3.21.0-r0: task do_create_spdx: Started
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Started
NOTE: recipe net-tools-2.10-r0: task do_create_spdx: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_create_spdx: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_compile: Succeeded
NOTE: Running task 2629 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile_ptest_base)
NOTE: recipe iproute2-6.3.0-r0: task do_package: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Started
NOTE: Running task 2630 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_packagedata)
NOTE: recipe iproute2-6.3.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2631 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_create_spdx)
NOTE: Running task 2632 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_package_write_rpm)
NOTE: recipe iproute2-6.3.0-r0: task do_create_spdx: Started
NOTE: recipe iproute2-6.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-6.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2633 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_install)
NOTE: recipe tcl-8.6.13-r0: task do_install: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Succeeded
NOTE: Running task 2634 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2635 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_package)
NOTE: Running task 2636 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_populate_sysroot)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2637 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_prepare_recipe_sysroot)
NOTE: recipe quota-4.09-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gzip-1.12-r0: task do_configure: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2638 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure_ptest_base)
NOTE: recipe quota-4.09-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2639 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_configure)
NOTE: recipe gzip-1.12-r0: task do_configure_ptest_base: Started
NOTE: recipe quota-4.09-r0: task do_configure: Started
NOTE: recipe gzip-1.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2640 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_compile)
NOTE: recipe gzip-1.12-r0: task do_compile: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_kernel_configme: Succeeded
NOTE: Running task 2641 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_configure)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_configure: Started
NOTE: recipe gzip-1.12-r0: task do_compile: Succeeded
NOTE: Running task 2642 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_compile_ptest_base)
NOTE: recipe gzip-1.12-r0: task do_compile_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2643 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_install)
NOTE: recipe gzip-1.12-r0: task do_install: Started
NOTE: recipe gzip-1.12-r0: task do_install: Succeeded
NOTE: Running task 2644 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_install_ptest_base)
NOTE: recipe gzip-1.12-r0: task do_install_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2645 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_package)
NOTE: recipe gzip-1.12-r0: task do_package: Started
NOTE: recipe ltp-20230516-r0: task do_configure: Succeeded
NOTE: Running task 2646 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_compile)
NOTE: recipe ltp-20230516-r0: task do_compile: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Succeeded
NOTE: Running task 2647 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2648 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_create_spdx)
NOTE: recipe libnl-1_3.7.0-r0: task do_create_spdx: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_configure: Succeeded
NOTE: Running task 2649 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_configcheck)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_kernel_configcheck: Started
NOTE: recipe gzip-1.12-r0: task do_package: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 2650 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_packagedata)
NOTE: Running task 2651 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_collect_spdx_deps)
NOTE: recipe gzip-1.12-r0: task do_packagedata: Started
NOTE: recipe quota-4.09-r0: task do_collect_spdx_deps: Started
NOTE: recipe tcl-8.6.13-r0: task do_install: Succeeded
NOTE: Running task 2652 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_install_ptest_base)
NOTE: recipe quota-4.09-r0: task do_configure: Succeeded
NOTE: Running task 2653 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_compile)
NOTE: recipe tcl-8.6.13-r0: task do_install_ptest_base: Started
NOTE: recipe quota-4.09-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gzip-1.12-r0: task do_packagedata: Succeeded
NOTE: Running task 2654 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_create_spdx)
NOTE: Running task 2655 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_package_write_rpm)
NOTE: recipe quota-4.09-r0: task do_compile: Started
NOTE: recipe gzip-1.12-r0: task do_create_spdx: Started
NOTE: recipe gzip-1.12-r0: task do_package_write_rpm: Started
NOTE: recipe tcl-8.6.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2656 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_populate_sysroot)
NOTE: Running task 2657 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_package)
NOTE: recipe tcl-8.6.13-r0: task do_populate_sysroot: Started
NOTE: recipe tcl-8.6.13-r0: task do_package: Started
NOTE: recipe gzip-1.12-r0: task do_create_spdx: Succeeded
NOTE: recipe quota-4.09-r0: task do_compile: Succeeded
NOTE: Running task 2658 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_install)
NOTE: recipe quota-4.09-r0: task do_install: Started
NOTE: recipe tcl-8.6.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2659 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe gzip-1.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe cpio-2.14-r0: task do_configure: Succeeded
NOTE: Running task 2660 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_configure_ptest_base)
NOTE: recipe expect-5.45.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cpio-2.14-r0: task do_configure_ptest_base: Started
NOTE: recipe cpio-2.14-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe quota-4.09-r0: task do_install: Succeeded
NOTE: Running task 2661 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_compile)
NOTE: Running task 2662 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_package)
NOTE: recipe expect-5.45.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2663 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_configure)
NOTE: recipe cpio-2.14-r0: task do_compile: Started
NOTE: recipe quota-4.09-r0: task do_package: Started
NOTE: recipe expect-5.45.4-r0: task do_configure: Started
NOTE: recipe cpio-2.14-r0: task do_compile: Succeeded
NOTE: Running task 2664 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_compile_ptest_base)
NOTE: recipe cpio-2.14-r0: task do_compile_ptest_base: Started
NOTE: recipe cpio-2.14-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2665 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_install)
NOTE: recipe cpio-2.14-r0: task do_install: Started
NOTE: recipe quota-4.09-r0: task do_package: Succeeded
NOTE: Running task 2666 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_packagedata)
NOTE: recipe quota-4.09-r0: task do_packagedata: Started
NOTE: recipe quota-4.09-r0: task do_packagedata: Succeeded
NOTE: Running task 2667 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_create_spdx)
NOTE: Running task 2668 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_package_write_rpm)
NOTE: recipe quota-4.09-r0: task do_create_spdx: Started
NOTE: recipe quota-4.09-r0: task do_package_write_rpm: Started
NOTE: recipe cpio-2.14-r0: task do_install: Succeeded
NOTE: Running task 2669 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_install_ptest_base)
NOTE: recipe cpio-2.14-r0: task do_install_ptest_base: Started
NOTE: recipe cpio-2.14-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2670 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_package)
NOTE: recipe cpio-2.14-r0: task do_package: Started
NOTE: recipe quota-4.09-r0: task do_create_spdx: Succeeded
NOTE: recipe quota-4.09-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_kernel_configcheck: Succeeded
NOTE: Running task 2671 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_compile)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_compile: Started
NOTE: recipe cpio-2.14-r0: task do_package: Succeeded
NOTE: Running task 2672 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_packagedata)
NOTE: recipe tcl-8.6.13-r0: task do_package: Succeeded
NOTE: Running task 2673 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_packagedata)
NOTE: recipe cpio-2.14-r0: task do_packagedata: Started
NOTE: recipe tcl-8.6.13-r0: task do_packagedata: Started
NOTE: recipe cpio-2.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2674 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_create_spdx)
NOTE: Running task 2675 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_package_write_rpm)
NOTE: recipe tcl-8.6.13-r0: task do_packagedata: Succeeded
NOTE: Running task 2676 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_create_spdx)
NOTE: recipe cpio-2.14-r0: task do_create_spdx: Started
NOTE: recipe cpio-2.14-r0: task do_package_write_rpm: Started
NOTE: recipe tcl-8.6.13-r0: task do_create_spdx: Started
NOTE: recipe expect-5.45.4-r0: task do_configure: Succeeded
NOTE: Running task 2677 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_configure_ptest_base)
NOTE: recipe expect-5.45.4-r0: task do_configure_ptest_base: Started
NOTE: recipe expect-5.45.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2678 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_compile)
NOTE: recipe cpio-2.14-r0: task do_create_spdx: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_compile: Started
NOTE: recipe tcl-8.6.13-r0: task do_create_spdx: Succeeded
NOTE: Running task 2679 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_collect_spdx_deps)
NOTE: recipe expect-5.45.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe expect-5.45.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_compile: Succeeded
NOTE: Running task 2680 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_compile_ptest_base)
NOTE: recipe expect-5.45.4-r0: task do_compile_ptest_base: Started
NOTE: recipe expect-5.45.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2681 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_install)
NOTE: recipe expect-5.45.4-r0: task do_install: Started
NOTE: recipe cpio-2.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_install: Succeeded
NOTE: Running task 2682 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_install_ptest_base)
NOTE: recipe expect-5.45.4-r0: task do_install_ptest_base: Started
NOTE: recipe expect-5.45.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2683 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package)
NOTE: recipe expect-5.45.4-r0: task do_package: Started
NOTE: recipe expect-5.45.4-r0: task do_package: Succeeded
NOTE: Running task 2684 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_packagedata)
NOTE: recipe expect-5.45.4-r0: task do_packagedata: Started
NOTE: recipe expect-5.45.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2685 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_create_spdx)
NOTE: Running task 2686 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_rpm)
NOTE: recipe expect-5.45.4-r0: task do_create_spdx: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm: Started
NOTE: recipe expect-5.45.4-r0: task do_create_spdx: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_compile: Succeeded
NOTE: Running task 2687 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_shared_workdir)
NOTE: Running task 2688 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_link_images)
NOTE: Running task 2689 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_transform_kernel)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_shared_workdir: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_transform_kernel: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_kernel_link_images: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_transform_kernel: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_kernel_link_images: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_shared_workdir: Succeeded
NOTE: Running task 2690 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_compile_kernelmodules)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_compile_kernelmodules: Started
NOTE: recipe gdb-13.1-r0: task do_compile: Succeeded
NOTE: Running task 2691 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_install)
NOTE: recipe gdb-13.1-r0: task do_install: Started
NOTE: recipe gdb-13.1-r0: task do_install: Succeeded
NOTE: Running task 2692 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_package)
NOTE: recipe gdb-13.1-r0: task do_package: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_compile_kernelmodules: Succeeded
NOTE: Running task 2693 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_strip)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_strip: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_strip: Succeeded
NOTE: Running task 2694 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_sizecheck)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_sizecheck: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_sizecheck: Succeeded
NOTE: Running task 2695 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_install)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_install: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_install: Succeeded
NOTE: Running task 2696 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_package)
NOTE: Running task 2697 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_bundle_initramfs)
NOTE: Running task 2698 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_populate_sysroot)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_package: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_bundle_initramfs: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_populate_sysroot: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_bundle_initramfs: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdb-13.1-r0: task do_package: Succeeded
NOTE: Running task 2699 of 2713 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_packagedata)
NOTE: recipe gdb-13.1-r0: task do_packagedata: Started
NOTE: recipe gdb-13.1-r0: task do_packagedata: Failed
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_package: Succeeded
NOTE: recipe ltp-20230516-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2699 tasks of which 2458 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 47 ERROR messages, returning a non-zero exit code.
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-src went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dbg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-ptest went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-gawkbug went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-staticdev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-doc went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-bg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ca went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-da went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-de went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-es went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fi went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fr went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-id went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-it went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ja went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ko went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ms went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-nl went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pl went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pt went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pt-br went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ro went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-sr went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-sv went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-vi went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-zh-cn went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-src went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-dbg went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdbserver went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-staticdev went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-dev went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-doc went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-locale went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/gdb/13.1-r0/temp/log.do_packagedata.68911
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_packagedata) failed with exit code '1'

--===============1068248349379527986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/ltp/ltp: FILELIST: removed "/opt/ltp/testcases/bin/tomoyo_policy_memory_test /opt/ltp/testcases/bin/tomoyo_filesystem_test /opt/ltp/testcases/bin/fcntl06 /opt/ltp/testcases/bin/testall.sh /opt/ltp/testcases/bin/utstest /opt/ltp/testcases/bin/tomoyo_policy_io_test /opt/ltp/testcases/bin/ns_ifmove /opt/ltp/testcases/bin/runutstests_noltp.sh /opt/ltp/testcases/bin/tomoyo_accept_test /opt/ltp/testcases/bin/tomoyo_rewrite_test /opt/ltp/testcases/bin/tomoyo_file_test /opt/ltp/testcases/bin/ns_create /opt/ltp/testcases/bin/newns /opt/ltp/testcases/bin/fcntl06_64 /opt/ltp/testcases/data/file01/in.ksh /opt/ltp/testcases/data/file01/in.csh /opt/ltp/testcases/bin/setns_check /opt/ltp/testcases/bin/semget06 /opt/ltp/testcases/bin/ns_exec /opt/ltp/testcases/bin/semget03 /opt/ltp/testcases/bin/tomoyo_new_file_test /opt/ltp/testcases/bin/sem01 /opt/ltp/bin/execltp /opt/ltp/testcases/bin/sem02 /opt/ltp/testcases/bin/tomoyo_new_test", added "/opt/ltp/testcases/bin/tst_ns_
 exec /opt/ltp/testcases/bin/mmap20 /opt/ltp/testcases/bin/semop04 /opt/ltp/testcases/bin/semop05 /opt/ltp/testcases/bin/tst_ns_create /opt/ltp/testcases/bin/hugemmap32 /opt/ltp/testcases/bin/fsconfig03 /opt/ltp/testcases/bin/tst_ns_ifmove /opt/ltp/testcases/bin/cgroup_core03 /opt/ltp/testcases/bin/kvm_svm01 /opt/ltp/testcases/bin/mprotect05 /opt/ltp/testcases/bin/mq_notify03 /opt/ltp/testcases/bin/mount07 /opt/ltp/testcases/bin/tst_fsfreeze /opt/ltp/testcases/bin/nfs08.sh /opt/ltp/testcases/bin/madvise11 /opt/ltp/testcases/bin/utsname04 /opt/ltp/testcases/bin/utsname01 /opt/ltp/testcases/bin/utsname03 /opt/ltp/testcases/bin/utsname02"

--===============1068248349379527986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 63 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:139957818288bcea346f96136ccee884fc495c23"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 126 Local 27 Mirrors 0 Missed 99 Current 717 (21% match, 88% complete)
Removing 1 stale sstate objects for arch mips32r2...done.
NOTE: Executing Tasks
NOTE: Running setscene task 726 of 843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 735 of 843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 749 of 843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_create_spdx_setscene)
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 839 of 843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/btrfs-tools/6.3-r0/temp/log.do_packagedata_setscene.3580511
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 840 of 843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_package_setscene)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gawk/5.2.1-r0/temp/log.do_packagedata_setscene.3580784
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 841 of 843 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_setscene)
NOTE: Running task 1315 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_fetch)
NOTE: Running task 1540 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_fetch)
NOTE: Running task 1618 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_validate_branches)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Started
NOTE: Running task 1751 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_fetch)
NOTE: Running task 1752 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_fetch)
NOTE: Running task 1753 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_fetch)
NOTE: Running task 1754 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_fetch)
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Succeeded
NOTE: Running task 1786 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_unpack)
NOTE: Running task 1787 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Started
NOTE: Running task 1832 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_fetch)
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_package_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Started
NOTE: Running task 1876 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_unpack)
NOTE: Running task 1877 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1902 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_populate_sysroot)
NOTE: Running task 1905 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_populate_sysroot)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_validate_branches: Started
NOTE: Running task 1950 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_fetch)
NOTE: recipe expect-5.45.4-r0: task do_fetch: Started
NOTE: recipe gzip-1.12-r0: task do_fetch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Started
NOTE: recipe cpio-2.14-r0: task do_fetch: Started
NOTE: Running task 2007 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_fetch)
NOTE: Running task 2008 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_fetch)
NOTE: Running task 2009 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: Running task 2010 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_fetch)
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Started
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Started
NOTE: recipe gzip-1.12-r0: task do_fetch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_fetch: Succeeded
NOTE: Running task 2045 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_unpack)
NOTE: Running task 2046 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_unpack)
NOTE: Running task 2047 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe expect-5.45.4-r0: task do_fetch: Succeeded
NOTE: Running task 2048 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_unpack)
NOTE: Running task 2062 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_unpack)
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2135 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_populate_sysroot: Started
NOTE: Running task 2160 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_configure_ptest_base)
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Started
NOTE: Running task 2161 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_unpack)
NOTE: Running task 2162 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_prepare_recipe_sysroot)
NOTE: recipe ltp-20230516-r0: task do_fetch: Started
NOTE: recipe net-tools-2.10-r0: task do_fetch: Started
NOTE: recipe gdb-13.1-r0: task do_fetch: Started
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Succeeded
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: Running task 2194 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Started
NOTE: Running task 2195 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_patch)
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe gdb-13.1-r0: task do_fetch: Succeeded
NOTE: Running task 2223 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_compile)
NOTE: Running task 2224 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: Running task 2232 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_unpack)
NOTE: Running task 2233 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_unpack)
NOTE: Running task 2234 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gzip-1.12-r0: task do_unpack: Started
NOTE: recipe cpio-2.14-r0: task do_unpack: Started
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2235 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe ltp-20230516-r0: task do_fetch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_fetch: Succeeded
NOTE: Running task 2247 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_unpack)
NOTE: Running task 2248 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_unpack)
NOTE: Running task 2249 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Started
NOTE: recipe expect-5.45.4-r0: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe diffutils-3.9-r0: task do_configure_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_unpack: Succeeded
NOTE: Running task 2362 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_patch)
NOTE: recipe iproute2-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Started
NOTE: Running task 2399 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_patch)
NOTE: Running task 2414 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_collect_spdx_deps)
NOTE: recipe cpio-2.14-r0: task do_unpack: Succeeded
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: recipe tar-1.34-r0: task do_compile: Started
NOTE: recipe diffutils-3.9-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2415 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_patch)
NOTE: Running task 2418 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_collect_spdx_deps)
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gdb-13.1-r0: task do_unpack: Started
NOTE: recipe gdb-13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Started
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Succeeded
NOTE: Running task 2419 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_compile)
NOTE: Running task 2420 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_patch)
NOTE: Running task 2421 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_collect_spdx_deps)
NOTE: recipe ltp-20230516-r0: task do_unpack: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Started
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2423 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_collect_spdx_deps)
NOTE: recipe expect-5.45.4-r0: task do_unpack: Succeeded
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2424 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_patch)
NOTE: Running task 2425 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Succeeded
NOTE: Running task 2442 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_collect_spdx_deps)
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 2443 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2444 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_patch)
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2454 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_collect_spdx_deps)
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_collect_spdx_deps: Started
NOTE: recipe iptables-1.8.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe tcl-8.6.13-r0: task do_patch: Started
NOTE: Running task 2455 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_collect_spdx_deps)
NOTE: recipe cpio-2.14-r0: task do_patch: Started
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Succeeded
NOTE: Running task 2456 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_collect_spdx_deps)
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe tcl-8.6.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe expect-5.45.4-r0: task do_patch: Started
NOTE: Running task 2457 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2460 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_collect_spdx_deps)
NOTE: recipe diffutils-3.9-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2461 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_collect_spdx_deps)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_populate_sysroot: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2462 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx)
NOTE: recipe iptables-1.8.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gzip-1.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2463 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_patch: Started
NOTE: Running task 2465 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_collect_spdx_deps)
NOTE: recipe cpio-2.14-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2466 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_create_spdx)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_validate_branches: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2471 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gzip-1.12-r0: task do_patch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2472 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_metadata)
NOTE: Running task 2473 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata)
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gzip-1.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe which-2.21-r3: task do_collect_spdx_deps: Started
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Succeeded
NOTE: Running task 2474 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 2479 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package_write_rpm)
NOTE: recipe coreutils-9.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2480 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_patch)
NOTE: recipe cpio-2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2481 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_configure)
NOTE: recipe cpio-2.14-r0: task do_patch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_create_spdx: Started
NOTE: Running task 2482 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2483 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2484 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_collect_spdx_deps)
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe unzip-1_6.0-r5: task do_collect_spdx_deps: Started
NOTE: Running task 2485 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch)
NOTE: Running task 2487 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe iptables-1.8.9-r0: task do_create_spdx: Started
NOTE: recipe logrotate-3.21.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_packagedata: Started
NOTE: recipe gdb-13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe which-2.21-r3: task do_collect_spdx_deps: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Started
NOTE: Running task 2488 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_create_spdx)
NOTE: Running task 2489 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_package_write_rpm)
NOTE: Running task 2492 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: Running task 2493 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata: Started
NOTE: Running task 2494 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_create_spdx)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_kernel_metadata: Started
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libaio-0.3.113-r0: task do_patch: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_configure: Started
NOTE: Running task 2497 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_patch)
NOTE: Running task 2498 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_collect_spdx_deps)
NOTE: recipe cronie-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_collect_spdx_deps: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_collect_spdx_deps: Started
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2499 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2500 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure)
NOTE: Running task 2501 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx)
NOTE: recipe bc-1.07.1-r0: task do_create_spdx: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe which-2.21-r3: task do_create_spdx: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_patch: Started
NOTE: recipe net-tools-2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Started
NOTE: Setscene tasks completed
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_create_spdx: Started
NOTE: Running task 2514 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: recipe curl-8.1.2-r0: task do_package_write_rpm: Started
NOTE: Running task 2516 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure)
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2517 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_packagedata: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata: Succeeded
NOTE: Running task 2518 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: Running task 2519 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure)
NOTE: recipe net-tools-2.10-r0: task do_patch: Succeeded
NOTE: Running task 2520 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: recipe tcl-8.6.13-r0: task do_patch: Succeeded
NOTE: recipe ltp-20230516-r0: task do_unpack: Succeeded
NOTE: Running task 2521 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_deploy_source_date_epoch)
NOTE: recipe libaio-0.3.113-r0: task do_patch: Succeeded
NOTE: Running task 2522 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_patch)
NOTE: Running task 2523 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_deploy_source_date_epoch)
NOTE: recipe gzip-1.12-r0: task do_configure: Started
NOTE: recipe cpio-2.14-r0: task do_configure: Started
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2524 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Started
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20230516-r0: task do_patch: Started
NOTE: recipe iproute2-6.3.0-r0: task do_configure: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_create_spdx: Succeeded
NOTE: Running task 2525 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_compile)
NOTE: recipe expect-5.45.4-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_create_spdx: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_configure: Started
NOTE: Running task 2526 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_deploy_source_date_epoch)
NOTE: recipe bc-1.07.1-r0: task do_create_spdx: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_compile: Started
NOTE: Running task 2527 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_configure)
NOTE: recipe unzip-1_6.0-r5: task do_create_spdx: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2528 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure)
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2529 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_configure)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_configure: Started
NOTE: recipe ltp-20230516-r0: task do_patch: Succeeded
NOTE: Running task 2533 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_configure: Started
NOTE: Running task 2534 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_deploy_source_date_epoch)
NOTE: recipe tcl-8.6.13-r0: task do_configure: Started
NOTE: Running task 2535 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: Running task 2536 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_populate_lic)
NOTE: recipe net-tools-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2537 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_compile)
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ltp-20230516-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libaio-0.3.113-r0: task do_configure: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: Running task 2538 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_compile)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Started
NOTE: recipe ltp-20230516-r0: task do_populate_lic: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_compile: Started
NOTE: Running task 2539 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe libaio-0.3.113-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Succeeded
NOTE: recipe ltp-20230516-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe ltp-20230516-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_populate_lic unihash changed to 6b88f8970844d4543941eefd5ce03a3931574075b4ac7e3e828876c02ba34b82
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe libaio-0.3.113-r0: task do_compile: Succeeded
NOTE: Running task 2540 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_install: Started
NOTE: recipe gdb-13.1-r0: task do_unpack: Succeeded
NOTE: Running task 2541 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_patch)
NOTE: Running task 2542 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_collect_spdx_deps)
NOTE: recipe libaio-0.3.113-r0: task do_install: Succeeded
NOTE: Running task 2543 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package)
NOTE: Running task 2544 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot)
NOTE: recipe gdb-13.1-r0: task do_patch: Started
NOTE: recipe gdb-13.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Started
NOTE: recipe gdb-13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 2545 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_collect_spdx_deps)
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2546 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-6.3.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe ltp-20230516-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.3.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ltp-20230516-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2547 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_configure)
NOTE: recipe gdb-13.1-r0: task do_patch: Succeeded
NOTE: Running task 2548 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gdb-13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20230516-r0: task do_configure: Started
NOTE: recipe gdb-13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2549 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_configure)
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gdb-13.1-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm unihash changed to 586e907c94f965d0b1bcd2d80456ce6523ed55a19535c7b1395ac5c19b19cdaa
NOTE: recipe libaio-0.3.113-r0: task do_package: Succeeded
NOTE: Running task 2550 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_kernel_metadata: Succeeded
NOTE: Running task 2551 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_patch)
NOTE: Running task 2552 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_version_sanity_check)
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_kernel_version_sanity_check: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_kernel_version_sanity_check: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Succeeded
NOTE: Running task 2553 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_create_spdx)
NOTE: Running task 2554 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm)
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Started
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx: Started
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx: Succeeded
NOTE: Running task 2555 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_collect_spdx_deps)
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Succeeded
NOTE: recipe ltp-20230516-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_patch: Succeeded
NOTE: Running task 2556 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_configme)
NOTE: Running task 2557 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_deploy_source_date_epoch)
NOTE: recipe ltp-20230516-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_compile: Succeeded
NOTE: Running task 2558 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_compile_ptest_base)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_kernel_configme: Started
NOTE: recipe diffutils-3.9-r0: task do_compile_ptest_base: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe diffutils-3.9-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2559 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_install)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_install: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure: Succeeded
NOTE: Running task 2560 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_configure_ptest_base)
NOTE: recipe tar-1.34-r0: task do_compile: Succeeded
NOTE: Running task 2561 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_install)
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Started
NOTE: recipe gdb-13.1-r0: task do_configure: Succeeded
NOTE: Running task 2562 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_compile)
NOTE: recipe tar-1.34-r0: task do_install: Started
NOTE: recipe logrotate-3.21.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2563 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile)
NOTE: recipe gdb-13.1-r0: task do_compile: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2564 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe diffutils-3.9-r0: task do_install: Succeeded
NOTE: Running task 2565 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_install_ptest_base)
NOTE: recipe cronie-1.6.1-r0: task do_configure: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_install_ptest_base: Started
NOTE: Running task 2566 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_compile)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2567 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe diffutils-3.9-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2568 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_package)
NOTE: recipe diffutils-3.9-r0: task do_package: Started
NOTE: recipe curl-8.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile: Succeeded
NOTE: Running task 2569 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_compile_ptest_base)
NOTE: recipe tar-1.34-r0: task do_install: Succeeded
NOTE: Running task 2570 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Succeeded
NOTE: Running task 2571 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_install)
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Started
NOTE: recipe tar-1.34-r0: task do_package: Started
NOTE: recipe logrotate-3.21.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2572 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_install: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2573 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe cronie-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2574 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package)
NOTE: recipe logrotate-3.21.0-r0: task do_install: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: Running task 2575 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_install_ptest_base)
NOTE: recipe cronie-1.6.1-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2576 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure_ptest_base)
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2577 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2578 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe logrotate-3.21.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2579 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package)
NOTE: recipe logrotate-3.21.0-r0: task do_package: Started
NOTE: recipe net-tools-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2580 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_install)
NOTE: recipe net-tools-2.10-r0: task do_install: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2581 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2582 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile)
NOTE: recipe tcl-8.6.13-r0: task do_compile: Started
NOTE: recipe net-tools-2.10-r0: task do_install: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_package: Succeeded
NOTE: Running task 2583 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package)
NOTE: Running task 2584 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata)
NOTE: recipe net-tools-2.10-r0: task do_package: Started
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Started
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2585 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_create_spdx)
NOTE: Running task 2586 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package_write_rpm)
NOTE: recipe cronie-1.6.1-r0: task do_create_spdx: Started
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Started
NOTE: recipe cronie-1.6.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2587 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Started
NOTE: recipe diffutils-3.9-r0: task do_package: Succeeded
NOTE: Running task 2588 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_packagedata)
NOTE: recipe tar-1.34-r0: task do_package: Succeeded
NOTE: Running task 2589 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata)
NOTE: recipe diffutils-3.9-r0: task do_packagedata: Started
NOTE: recipe tar-1.34-r0: task do_packagedata: Started
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_compile: Succeeded
NOTE: Running task 2590 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_install)
NOTE: recipe iproute2-6.3.0-r0: task do_install: Started
NOTE: recipe diffutils-3.9-r0: task do_packagedata: Succeeded
NOTE: Running task 2591 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_write_rpm)
NOTE: recipe tar-1.34-r0: task do_packagedata: Succeeded
NOTE: Running task 2592 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_create_spdx)
NOTE: Running task 2593 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm)
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Started
NOTE: recipe tar-1.34-r0: task do_create_spdx: Started
NOTE: recipe tar-1.34-r0: task do_package_write_rpm: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2594 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2595 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install)
NOTE: recipe iproute2-6.3.0-r0: task do_install: Succeeded
NOTE: Running task 2596 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe net-tools-2.10-r0: task do_package: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Started
NOTE: Running task 2597 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_packagedata)
NOTE: recipe iproute2-6.3.0-r0: task do_package: Started
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe tar-1.34-r0: task do_create_spdx: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2598 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_create_spdx)
NOTE: Running task 2599 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_rpm)
NOTE: recipe logrotate-3.21.0-r0: task do_package: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_create_spdx: Started
NOTE: Running task 2600 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_packagedata)
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Started
NOTE: recipe logrotate-3.21.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2601 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_create_spdx)
NOTE: Running task 2602 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_package_write_rpm)
NOTE: recipe net-tools-2.10-r0: task do_create_spdx: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_create_spdx: Started
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Started
NOTE: recipe logrotate-3.21.0-r0: task do_create_spdx: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_compile: Succeeded
NOTE: Running task 2603 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Started
NOTE: recipe iproute2-6.3.0-r0: task do_package: Succeeded
NOTE: Running task 2604 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_packagedata)
NOTE: recipe iproute2-6.3.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.3.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2605 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_create_spdx)
NOTE: Running task 2606 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_package_write_rpm)
NOTE: recipe iproute2-6.3.0-r0: task do_create_spdx: Started
NOTE: recipe iproute2-6.3.0-r0: task do_package_write_rpm: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2607 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_install)
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Succeeded
NOTE: Running task 2608 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_install: Started
NOTE: recipe iproute2-6.3.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2609 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_package)
NOTE: Running task 2610 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_populate_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2611 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_prepare_recipe_sysroot)
NOTE: recipe quota-4.09-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gzip-1.12-r0: task do_configure: Succeeded
NOTE: Running task 2612 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure_ptest_base)
NOTE: recipe gzip-1.12-r0: task do_configure_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2613 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_compile)
NOTE: recipe gzip-1.12-r0: task do_compile: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_kernel_configme: Succeeded
NOTE: Running task 2614 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_configure)
NOTE: recipe quota-4.09-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2615 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_configure)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_configure: Started
NOTE: recipe quota-4.09-r0: task do_configure: Started
NOTE: recipe gzip-1.12-r0: task do_compile: Succeeded
NOTE: Running task 2616 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_compile_ptest_base)
NOTE: recipe gzip-1.12-r0: task do_compile_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2617 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_install)
NOTE: recipe iproute2-6.3.0-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gzip-1.12-r0: task do_install: Started
NOTE: recipe ltp-20230516-r0: task do_configure: Succeeded
NOTE: Running task 2618 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_compile)
NOTE: recipe ltp-20230516-r0: task do_compile: Started
NOTE: recipe gzip-1.12-r0: task do_install: Succeeded
NOTE: Running task 2619 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_install_ptest_base)
NOTE: recipe gzip-1.12-r0: task do_install_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2620 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_package)
NOTE: recipe gzip-1.12-r0: task do_package: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_configure: Succeeded
NOTE: Running task 2621 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_configcheck)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_kernel_configcheck: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_package: Succeeded
NOTE: Running task 2622 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_packagedata)
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2623 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_create_spdx)
NOTE: recipe libnl-1_3.7.0-r0: task do_create_spdx: Started
NOTE: recipe gzip-1.12-r0: task do_package: Succeeded
NOTE: Running task 2624 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_packagedata)
NOTE: recipe gzip-1.12-r0: task do_packagedata: Started
NOTE: recipe gzip-1.12-r0: task do_packagedata: Succeeded
NOTE: Running task 2625 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_create_spdx)
NOTE: Running task 2626 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_package_write_rpm)
NOTE: recipe gzip-1.12-r0: task do_create_spdx: Started
NOTE: recipe gzip-1.12-r0: task do_package_write_rpm: Started
NOTE: recipe quota-4.09-r0: task do_configure: Succeeded
NOTE: Running task 2627 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_compile)
NOTE: recipe quota-4.09-r0: task do_compile: Started
NOTE: recipe tcl-8.6.13-r0: task do_install: Succeeded
NOTE: Running task 2628 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_install_ptest_base)
NOTE: recipe cpio-2.14-r0: task do_configure: Succeeded
NOTE: Running task 2629 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_configure_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_install_ptest_base: Started
NOTE: recipe cpio-2.14-r0: task do_configure_ptest_base: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gzip-1.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 2630 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_collect_spdx_deps)
NOTE: recipe cpio-2.14-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2631 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_compile)
NOTE: recipe quota-4.09-r0: task do_collect_spdx_deps: Started
NOTE: recipe cpio-2.14-r0: task do_compile: Started
NOTE: recipe quota-4.09-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2632 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_populate_sysroot)
NOTE: Running task 2633 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_package)
NOTE: recipe tcl-8.6.13-r0: task do_populate_sysroot: Started
NOTE: recipe quota-4.09-r0: task do_compile: Succeeded
NOTE: Running task 2634 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_install)
NOTE: recipe tcl-8.6.13-r0: task do_package: Started
NOTE: recipe quota-4.09-r0: task do_install: Started
NOTE: recipe gzip-1.12-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2635 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe quota-4.09-r0: task do_install: Succeeded
NOTE: Running task 2636 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_package)
NOTE: recipe expect-5.45.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe quota-4.09-r0: task do_package: Started
NOTE: recipe expect-5.45.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2637 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_configure)
NOTE: recipe expect-5.45.4-r0: task do_configure: Started
NOTE: recipe cpio-2.14-r0: task do_compile: Succeeded
NOTE: Running task 2638 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_compile_ptest_base)
NOTE: recipe cpio-2.14-r0: task do_compile_ptest_base: Started
NOTE: recipe cpio-2.14-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2639 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_install)
NOTE: recipe cpio-2.14-r0: task do_install: Started
NOTE: recipe cpio-2.14-r0: task do_install: Succeeded
NOTE: Running task 2640 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_install_ptest_base)
NOTE: recipe cpio-2.14-r0: task do_install_ptest_base: Started
NOTE: recipe cpio-2.14-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2641 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_package)
NOTE: recipe quota-4.09-r0: task do_package: Succeeded
NOTE: Running task 2642 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_packagedata)
NOTE: recipe cpio-2.14-r0: task do_package: Started
NOTE: recipe quota-4.09-r0: task do_packagedata: Started
NOTE: recipe quota-4.09-r0: task do_packagedata: Succeeded
NOTE: Running task 2643 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_create_spdx)
NOTE: Running task 2644 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_package_write_rpm)
NOTE: recipe quota-4.09-r0: task do_create_spdx: Started
NOTE: recipe quota-4.09-r0: task do_package_write_rpm: Started
NOTE: recipe quota-4.09-r0: task do_create_spdx: Succeeded
NOTE: recipe quota-4.09-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_kernel_configcheck: Succeeded
NOTE: Running task 2645 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_compile)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_compile: Started
NOTE: recipe cpio-2.14-r0: task do_package: Succeeded
NOTE: Running task 2646 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_packagedata)
NOTE: recipe cpio-2.14-r0: task do_packagedata: Started
NOTE: recipe cpio-2.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2647 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_create_spdx)
NOTE: Running task 2648 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_package_write_rpm)
NOTE: recipe cpio-2.14-r0: task do_create_spdx: Started
NOTE: recipe cpio-2.14-r0: task do_package_write_rpm: Started
NOTE: recipe cpio-2.14-r0: task do_create_spdx: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_package: Succeeded
NOTE: Running task 2649 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_packagedata)
NOTE: recipe tcl-8.6.13-r0: task do_packagedata: Started
NOTE: recipe expect-5.45.4-r0: task do_configure: Succeeded
NOTE: Running task 2650 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_configure_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_packagedata: Succeeded
NOTE: Running task 2651 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_create_spdx)
NOTE: recipe expect-5.45.4-r0: task do_configure_ptest_base: Started
NOTE: recipe expect-5.45.4-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2652 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_compile)
NOTE: recipe tcl-8.6.13-r0: task do_create_spdx: Started
NOTE: recipe expect-5.45.4-r0: task do_compile: Started
NOTE: recipe cpio-2.14-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_create_spdx: Succeeded
NOTE: Running task 2653 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_collect_spdx_deps)
NOTE: recipe expect-5.45.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe expect-5.45.4-r0: task do_compile: Succeeded
NOTE: Running task 2654 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_compile_ptest_base)
NOTE: recipe expect-5.45.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_compile_ptest_base: Started
NOTE: recipe expect-5.45.4-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2655 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_install)
NOTE: recipe expect-5.45.4-r0: task do_install: Started
NOTE: recipe expect-5.45.4-r0: task do_install: Succeeded
NOTE: Running task 2656 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_install_ptest_base)
NOTE: recipe expect-5.45.4-r0: task do_install_ptest_base: Started
NOTE: recipe expect-5.45.4-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2657 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package)
NOTE: recipe expect-5.45.4-r0: task do_package: Started
NOTE: recipe expect-5.45.4-r0: task do_package: Succeeded
NOTE: Running task 2658 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_packagedata)
NOTE: recipe expect-5.45.4-r0: task do_packagedata: Started
NOTE: recipe expect-5.45.4-r0: task do_packagedata: Succeeded
NOTE: Running task 2659 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_create_spdx)
NOTE: Running task 2660 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_package_write_rpm)
NOTE: recipe expect-5.45.4-r0: task do_create_spdx: Started
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm: Started
NOTE: recipe expect-5.45.4-r0: task do_create_spdx: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_compile: Succeeded
NOTE: Running task 2661 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_shared_workdir)
NOTE: Running task 2662 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_link_images)
NOTE: Running task 2663 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_transform_kernel)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_shared_workdir: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_kernel_link_images: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_transform_kernel: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_kernel_link_images: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_transform_kernel: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_shared_workdir: Succeeded
NOTE: Running task 2664 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_compile_kernelmodules)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_compile_kernelmodules: Started
NOTE: recipe gdb-13.1-r0: task do_compile: Succeeded
NOTE: Running task 2665 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_install)
NOTE: recipe gdb-13.1-r0: task do_install: Started
NOTE: recipe gdb-13.1-r0: task do_install: Succeeded
NOTE: Running task 2666 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_package)
NOTE: recipe gdb-13.1-r0: task do_package: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_compile_kernelmodules: Succeeded
NOTE: Running task 2667 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_strip)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_strip: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_strip: Succeeded
NOTE: Running task 2668 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_sizecheck)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_sizecheck: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_sizecheck: Succeeded
NOTE: Running task 2669 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_install)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_install: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_install: Succeeded
NOTE: Running task 2670 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_package)
NOTE: Running task 2671 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_bundle_initramfs)
NOTE: Running task 2672 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_populate_sysroot)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_package: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_bundle_initramfs: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_populate_sysroot: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_bundle_initramfs: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdb-13.1-r0: task do_package: Succeeded
NOTE: Running task 2673 of 2687 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_packagedata)
NOTE: recipe gdb-13.1-r0: task do_packagedata: Started
NOTE: recipe gdb-13.1-r0: task do_packagedata: Failed
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_3adbad6b7c-r0: task do_package: Succeeded
NOTE: recipe ltp-20230516-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2673 tasks of which 2432 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 47 ERROR messages, returning a non-zero exit code.
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-src went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dbg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-ptest went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-gawkbug went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-staticdev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-doc went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-bg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ca went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-da went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-de went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-es went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fi went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fr went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-id went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-it went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ja went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ko went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ms went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-nl went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pl went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pt went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pt-br went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ro went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-sr went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-sv went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-vi went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-zh-cn went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-src went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-dbg went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdbserver went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-staticdev went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-dev went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-doc went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb-locale went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: QA Issue: Package version for package gdb went backwards which would break package feeds (from 0:13.2-r0 to 0:13.1-r0) [version-going-backwards]
ERROR: gdb-13.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/gdb/13.1-r0/temp/log.do_packagedata.3892629
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_packagedata) failed with exit code '1'

--===============1068248349379527986==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-ltp-upgrade-20230127-20230516.patch"

RnJvbSBlOWIzYTM5Nzg0MWI1ZDAwODU1Yzg1YmM3Mzc4MzJjY2Y5MGIyODJkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTY6NDM6NTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
dHA6IHVwZ3JhZGUgMjAyMzAxMjcgLT4gMjAyMzA1MTYKCi0tLQogbWV0YS9yZWNpcGVzLWV4dGVu
ZGVkL2x0cC97bHRwXzIwMjMwMTI3LmJiID0+IGx0cF8yMDIzMDUxNi5iYn0gfCAyICstCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3Jl
Y2lwZXMtZXh0ZW5kZWQvbHRwL3tsdHBfMjAyMzAxMjcuYmIgPT4gbHRwXzIwMjMwNTE2LmJifSAo
OTklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwXzIwMjMwMTI3
LmJiIGIvbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHBfMjAyMzA1MTYuYmIKc2ltaWxhcml0
eSBpbmRleCA5OSUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWV4dGVuZGVkL2x0cC9sdHBfMjAy
MzAxMjcuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1leHRlbmRlZC9sdHAvbHRwXzIwMjMwNTE2
LmJiCmluZGV4IDQzMjVhYTY2NzIuLjg4MjJmZDQ2NzQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1leHRlbmRlZC9sdHAvbHRwXzIwMjMwMTI3LmJiCisrKyBiL21ldGEvcmVjaXBlcy1leHRlbmRl
ZC9sdHAvbHRwXzIwMjMwNTE2LmJiCkBAIC0yNCw3ICsyNCw3IEBAIFRVTkVfQ0NBUkdTOnJlbW92
ZTp4ODYtNjQgPSAiLW1mcG1hdGg9c3NlIgogCiBDRkxBR1M6YXBwZW5kOnBvd2VycGM2NCA9ICIg
LURfX1NBTkVfVVNFUlNQQUNFX1RZUEVTX18iCiBDRkxBR1M6YXBwZW5kOm1pcHNhcmNobjY0ID0g
IiAtRF9fU0FORV9VU0VSU1BBQ0VfVFlQRVNfXyIKLVNSQ1JFViA9ICJkZDJkNjFhYzFhMWUwOTc5
N2E2MTY1ZjQ3OGFiZDRhOWY0ZjQzMDM1IgorU1JDUkVWID0gIjNlYmMyZGZhODVjMjQ0NWJiNjhk
OGMwZDY2ZTMzYzRkYTFlMWIzYTciCiAKIFNSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9saW51
eC10ZXN0LXByb2plY3QvbHRwLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKICAg
ICAgICAgICAgZmlsZTovLzAwMDEtUmVtb3ZlLU9PTS10ZXN0cy1mcm9tLXJ1bnRlc3QtbW0ucGF0
Y2ggXAotLSAKMi4zOS4yCgo=

--===============1068248349379527986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (0 cached, 898 parsed). 1802 targets, 47 skipped, 0 masked, 0 errors.
Removing 50 recipes from the core2-32 sysroot...done.
Removing 112 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:139957818288bcea346f96136ccee884fc495c23"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 573 Local 448 Mirrors 0 Missed 125 Current 250 (78% match, 84% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 252 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 253 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 270 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 274 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 279 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 286 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_create_spdx_setscene)
NOTE: Running setscene task 287 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 288 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 290 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_create_spdx_setscene)
NOTE: Running setscene task 294 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 297 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 299 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 312 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 314 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 333 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 349 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 357 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 358 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 360 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 361 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 365 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 367 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 393 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 394 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 398 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 402 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 404 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx_setscene)
NOTE: Running setscene task 405 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 406 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gawk-5.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe procps-4.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe coreutils-9.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe procps-4.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 417 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 418 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 419 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 420 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: recipe gawk-5.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 422 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-0.189-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 423 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene)
NOTE: recipe procps-4.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 424 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: recipe procps-4.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 426 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: Running setscene task 431 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_create_spdx_setscene)
NOTE: Running setscene task 432 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_create_spdx_setscene)
NOTE: recipe dbus-1.14.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 439 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 440 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 442 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 443 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 444 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 445 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 458 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 459 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 460 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 461 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 462 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_create_spdx_setscene)
NOTE: Running setscene task 463 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcheck/libcheck_0.15.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 465 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 468 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 473 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 476 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 477 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcheck-0.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 480 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_create_spdx_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_create_spdx_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.44-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 481 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_packagedata_setscene)
NOTE: recipe curl-8.1.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 482 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 483 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 484 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 485 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 486 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe perl-5.36.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe grep-3.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 805 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_fetch)
NOTE: recipe shadow-sysroot-4.6-r3: task do_create_spdx_setscene: Succeeded
NOTE: Running task 808 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_fetch)
NOTE: recipe procps-4.0.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 490 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_create_spdx_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_create_spdx_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 838 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_fetch)
NOTE: recipe file-5.44-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 497 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.1.bb:do_packagedata_setscene)
NOTE: Running task 855 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: recipe curl-8.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 499 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 873 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_fetch)
NOTE: Running task 874 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_fetch)
NOTE: Running task 875 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_fetch)
NOTE: Running task 876 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_fetch)
NOTE: Running task 886 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_fetch)
NOTE: Running task 897 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 899 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_fetch)
NOTE: Running task 901 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_fetch)
NOTE: Running task 918 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_fetch)
NOTE: Running task 920 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 928 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: Running task 929 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_fetch)
NOTE: Running task 936 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_fetch)
NOTE: Running task 937 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_fetch)
NOTE: Running task 938 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_fetch)
NOTE: Running task 939 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_fetch)
NOTE: Running task 940 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_fetch)
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 502 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: recipe expat-2.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 985 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: recipe libcheck-0.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 986 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_fetch)
NOTE: recipe lttng-ust-2_2.13.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 503 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 508 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 509 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 997 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe util-linux-2.38.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Started
NOTE: Running setscene task 511 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 512 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 515 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 516 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 517 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 518 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_fetch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Started
NOTE: Running setscene task 520 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 522 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/gawk/5.2.1-r0/temp/log.do_packagedata_setscene.177501
NOTE: recipe libnl-1_3.7.0-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 523 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-locales-1.0+gitAUTOINC+5663f5bfd3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe gzip-1.12-r0: task do_fetch: Started
NOTE: Running setscene task 529 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.9-r0: task do_fetch: Started
NOTE: recipe ltp-20230516-r0: task do_fetch: Started
NOTE: Running setscene task 530 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_packagedata_setscene)
NOTE: recipe diffutils-3.9-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 531 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe logrotate-3.21.0-r0: task do_fetch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe gzip-1.12-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_fetch: Started
NOTE: recipe gdb-13.1-r0: task do_fetch: Started
NOTE: recipe tar-1.34-r0: task do_fetch: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_fetch: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_fetch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Started
NOTE: recipe iptables-1.8.9-r0: task do_fetch: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cpio-2.14-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 536 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_package_setscene)
NOTE: Running setscene task 537 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe quota-4.09-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 538 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 540 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_populate_sysroot_setscene)
NOTE: Running task 1036 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_unpack)
NOTE: recipe tar-1.34-r0: task do_fetch: Succeeded
NOTE: Running task 1041 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_unpack)
NOTE: Running task 1042 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1043 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_unpack)
NOTE: Running task 1044 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_unpack)
NOTE: Running task 1045 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_unpack)
NOTE: recipe procps-4.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdb-13.1-r0: task do_fetch: Succeeded
NOTE: Running task 1048 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_fetch: Started
NOTE: recipe cronie-1.6.1-r0: task do_fetch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 545 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 548 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1049 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_unpack)
NOTE: recipe liburcu-0.14.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1050 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_unpack)
NOTE: Running setscene task 549 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_setscene)
NOTE: Running task 1051 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ltp-20230516-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1053 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_fetch: Succeeded
NOTE: Running setscene task 550 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 552 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 553 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 554 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 555 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 556 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_fetch: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1066 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_unpack)
NOTE: Running task 1068 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 1072 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 1073 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_unpack)
NOTE: Running task 1074 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_unpack)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_fetch: Succeeded
NOTE: Running task 1075 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_unpack)
NOTE: recipe liburcu-0.14.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1076 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_unpack)
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 560 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: Running task 1077 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_unpack)
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 562 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 568 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 569 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 573 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 576 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Started
NOTE: Running setscene task 580 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 582 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.41.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1102 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_unpack)
NOTE: Running task 1103 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_unpack)
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe gzip-1.12-r0: task do_unpack: Started
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Started
NOTE: recipe expect-5.45.4-r0: task do_unpack: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe iptables-1.8.9-r0: task do_unpack: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe cpio-2.14-r0: task do_unpack: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe diffutils-3.9-r0: task do_unpack: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ltp-20230516-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe iproute2-6.3.0-r0: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe gdb-13.1-r0: task do_unpack: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1104 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1105 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gzip-1.12-r0: task do_unpack: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1106 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_patch)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1107 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_patch)
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tar-1.34-r0: task do_unpack: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe quota-4.09-r0: task do_unpack: Started
NOTE: recipe cronie-1.6.1-r0: task do_unpack: Succeeded
NOTE: recipe libarchive-3.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1116 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_unpack: Started
NOTE: Running setscene task 592 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 596 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 597 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 598 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cpio-2.14-r0: task do_unpack: Succeeded
NOTE: Running setscene task 601 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: recipe quota-4.09-r0: task do_unpack: Succeeded
NOTE: Running task 1121 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_fetch)
NOTE: recipe expect-5.45.4-r0: task do_unpack: Succeeded
NOTE: Running task 1122 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_patch)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1123 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_patch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: Running setscene task 602 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 603 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Started
NOTE: Running setscene task 605 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 606 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1127 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_fetch)
NOTE: Running task 1141 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_patch)
NOTE: recipe libarchive-3.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_unpack: Succeeded
NOTE: recipe gzip-1.12-r0: task do_patch: Started
NOTE: Running setscene task 610 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 611 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 612 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 613 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 618 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 619 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 621 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe file-5.44-r0: task do_packagedata_setscene: Started
NOTE: Running task 1166 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_patch)
NOTE: Running task 1167 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_patch)
NOTE: Running task 1168 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_patch)
NOTE: recipe iptables-1.8.9-r0: task do_unpack: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1171 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_patch)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cpio-2.14-r0: task do_patch: Started
NOTE: Running task 1177 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_patch)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1178 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.76.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 628 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 632 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: Running task 1188 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: recipe sqlite3-3_3.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expect-5.45.4-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1198 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_patch: Succeeded
NOTE: recipe logrotate-3.21.0-r0: task do_patch: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_fetch: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tcl-8.6.13-r0: task do_unpack: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_fetch: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1203 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1204 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/logrotate/logrotate_3.21.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1217 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_unpack)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1218 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_patch)
NOTE: recipe iproute2-6.3.0-r0: task do_patch: Started
NOTE: recipe quota-4.09-r0: task do_patch: Started
NOTE: Running task 1219 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe cronie-1.6.1-r0: task do_patch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_fetch: Succeeded
NOTE: Running task 1220 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_unpack)
NOTE: recipe unzip-1_6.0-r5: task do_package_setscene: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_patch: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: Running task 1221 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe btrfs-tools-6.3-r0: task do_unpack: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_setscene: Started
NOTE: recipe diffutils-3.9-r0: task do_patch: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1222 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe gzip-1.12-r0: task do_patch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1223 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcl-8.6.13-r0: task do_patch: Started
NOTE: Running setscene task 637 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 640 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe gnutls-3.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe curl-8.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_unpack: Started
NOTE: Running setscene task 642 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe file-5.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Started
NOTE: Running setscene task 643 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package_setscene)
NOTE: Running setscene task 646 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 647 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: Running task 1224 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_deploy_source_date_epoch)
NOTE: recipe cpio-2.14-r0: task do_patch: Succeeded
NOTE: Running task 1225 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1226 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe libaio-0.3.113-r0: task do_unpack: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 650 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1231 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_patch)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1232 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 1233 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_deploy_source_date_epoch)
NOTE: recipe zstd-1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 653 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 655 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: Running setscene task 660 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_package_setscene)
NOTE: recipe diffutils-3.9-r0: task do_patch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Started
NOTE: recipe net-tools-2.10-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe quota-4.09-r0: task do_patch: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: Running task 1250 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 662 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 663 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 665 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 666 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1255 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/quota/quota_4.09.bb:do_deploy_source_date_epoch)
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe cronie-1.6.1-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.44-r0: task do_package_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_setscene: Succeeded
NOTE: Running task 1268 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_patch)
NOTE: Running task 1269 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_deploy_source_date_epoch)
NOTE: Running setscene task 671 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libaio-0.3.113-r0: task do_patch: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1270 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-6.3.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gnutls-3.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 674 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: recipe logrotate-3.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 675 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 676 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 677 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 678 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 683 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_create_spdx_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.1.2-r0: task do_package_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 688 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: Running task 1275 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: Running task 1276 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gzip-1.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1285 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_fetch)
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cpio-2.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 696 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2022.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe tar-1.34-r0: task do_patch: Started
NOTE: recipe file-5.44-r0: task do_package_setscene: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 698 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 699 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_unpack: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_patch: Succeeded
NOTE: recipe quota-4.09-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_patch: Succeeded
NOTE: Running task 1302 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_patch)
NOTE: Running task 1303 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1304 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_deploy_source_date_epoch)
NOTE: recipe libaio-0.3.113-r0: task do_patch: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Started
NOTE: Running task 1305 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ltp-20230516-r0: task do_unpack: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1310 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_patch)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_unpack: Succeeded
NOTE: Running setscene task 711 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_fetch: Succeeded
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running task 1319 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_patch)
NOTE: Running task 1324 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_unpack)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2022.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iptables-1.8.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tar-1.34-r0: task do_patch: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1325 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_deploy_source_date_epoch)
NOTE: Running task 1326 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe coreutils-9.1-r0: task do_unpack: Succeeded
NOTE: Running task 1327 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_patch)
NOTE: recipe tcl-8.6.13-r0: task do_patch: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_patch: Succeeded
NOTE: Running task 1328 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_deploy_source_date_epoch)
NOTE: recipe file-5.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1329 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/expect/expect_5.45.4.bb:do_deploy_source_date_epoch)
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ltp-20230516-r0: task do_patch: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_patch: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xorgproto-2022.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_patch: Started
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe net-tools-2.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1348 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe libaio-0.3.113-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_patch: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1353 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r5: task do_unpack: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_patch: Succeeded
NOTE: recipe ltp-20230516-r0: task do_patch: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1361 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_deploy_source_date_epoch)
NOTE: recipe expect-5.45.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1362 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_populate_lic)
NOTE: recipe tar-1.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1363 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe btrfs-tools-6.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20230516-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe ltp-20230516-r0: task do_populate_lic: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe gawk-5.2.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 726 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 727 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe ltp-20230516-r0: task do_populate_lic: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_populate_lic unihash changed to 6b88f8970844d4543941eefd5ce03a3931574075b4ac7e3e828876c02ba34b82
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ltp-20230516-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 1368 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 1373 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 731 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 732 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 733 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 734 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 735 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 736 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1378 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe gdb-13.1-r0: task do_unpack: Succeeded
NOTE: Running task 1379 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_patch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe gdb-13.1-r0: task do_patch: Started
NOTE: recipe attr-2.5.1-r0: task do_package_setscene: Started
NOTE: recipe curl-8.1.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 737 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 738 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 739 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 741 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_package_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 745 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_package_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 748 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 749 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdb-13.1-r0: task do_patch: Succeeded
NOTE: Running task 1392 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_deploy_source_date_epoch)
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_package_setscene: Started
NOTE: recipe gdb-13.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdb-13.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe perl-5.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 754 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 755 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.38.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 758 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 760 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 761 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.38.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 762 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.38.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 763 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 764 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 765 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 766 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 767 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 768 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.38.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.38.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 777 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 778 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 782 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 783 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 786 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 787 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 788 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 791 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 800 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 801 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 803 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_setscene)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_package_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 804 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 805 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 806 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 807 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 808 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 811 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 817 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 820 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.1.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 821 of 823 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.40.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1771 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1788 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1937 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1973 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1985 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1999 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2009 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2044 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2077 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2078 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2086 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2149 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2191 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2202 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2203 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2204 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe iptables-1.8.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2205 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2219 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: Running task 2249 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_collect_spdx_deps)
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2313 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcl-8.6.13-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2322 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_collect_spdx_deps)
NOTE: recipe tar-1.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2323 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure)
NOTE: recipe gdb-13.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2324 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_configure)
NOTE: recipe libnl-1_3.7.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2328 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gzip-1.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2329 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_configure)
NOTE: Running task 2330 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2331 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: Running task 2333 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_collect_spdx_deps)
NOTE: recipe btrfs-tools-6.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2334 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: Running task 2335 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_collect_spdx_deps)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2346 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_collect_spdx_deps)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2347 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_configure)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2348 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_configure: Started
NOTE: recipe tcl-8.6.13-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2349 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2350 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe coreutils-9.1-r0: task do_configure: Started
NOTE: Running task 2351 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_configure)
NOTE: recipe tcl-8.6.13-r0: task do_configure: Started
NOTE: Running task 2352 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_collect_spdx_deps)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe tcl-8.6.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2354 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_collect_spdx_deps)
NOTE: recipe diffutils-3.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gzip-1.12-r0: task do_configure: Started
NOTE: recipe tar-1.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_collect_spdx_deps: Started
NOTE: recipe which-2.21-r3: task do_collect_spdx_deps: Started
NOTE: Running task 2355 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.9.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_configure: Succeeded
NOTE: Running task 2356 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_configure)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Started
NOTE: Running task 2357 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_compile)
NOTE: Running task 2358 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_collect_spdx_deps)
NOTE: recipe libnl-1_3.7.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2359 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_collect_spdx_deps)
NOTE: recipe which-2.21-r3: task do_collect_spdx_deps: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe unzip-1_6.0-r5: task do_collect_spdx_deps: Started
NOTE: Running task 2360 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_collect_spdx_deps)
NOTE: recipe iptables-1.8.9-r0: task do_configure: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe net-tools-2.10-r0: task do_configure: Started
NOTE: Running task 2361 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2364 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_collect_spdx_deps)
NOTE: recipe libnl-1_3.7.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tar-1.34-r0: task do_configure: Started
NOTE: recipe diffutils-3.9-r0: task do_configure: Started
NOTE: Running task 2365 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe libaio-0.3.113-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_configure: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2366 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_compile)
NOTE: recipe net-tools-2.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2367 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_configure)
NOTE: recipe net-tools-2.10-r0: task do_configure: Succeeded
NOTE: Running task 2368 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_collect_spdx_deps)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: Running task 2369 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_compile)
NOTE: Running task 2376 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm)
NOTE: recipe bc-1.07.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe unzip-1_6.0-r5: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2377 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_create_spdx)
NOTE: recipe gzip-1.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdb-13.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2378 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_configure)
NOTE: recipe cronie-1.6.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2379 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.44.bb:do_package_write_rpm)
NOTE: recipe gdb-13.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2381 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Started
NOTE: recipe gzip-1.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_compile: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_configure: Started
NOTE: recipe tar-1.34-r0: task do_collect_spdx_deps: Started
NOTE: recipe net-tools-2.10-r0: task do_compile: Started
NOTE: recipe unzip-1_6.0-r5: task do_create_spdx: Started
NOTE: Running task 2383 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Started
NOTE: recipe gdb-13.1-r0: task do_configure: Started
NOTE: recipe tar-1.34-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2384 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_configure)
NOTE: recipe gdb-13.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_package_write_rpm: Started
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Started
NOTE: recipe libaio-0.3.113-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_configure: Started
NOTE: Running task 2385 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 2386 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_compile: Succeeded
NOTE: Running task 2387 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_install)
NOTE: recipe libaio-0.3.113-r0: task do_install: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_create_spdx: Succeeded
NOTE: Running task 2388 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package)
NOTE: Running task 2389 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_populate_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2390 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_install: Succeeded
NOTE: Running task 2391 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_populate_sysroot)
NOTE: Running task 2395 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_collect_spdx_deps)
NOTE: Running task 2397 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.1.2.bb:do_package_write_rpm)
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_populate_sysroot: Started
NOTE: recipe cpio-2.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe curl-8.1.2-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2399 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_prepare_recipe_sysroot)
NOTE: recipe cpio-2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2400 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: Running task 2401 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: recipe ltp-20230516-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe ptest-runner-2.4.2+gitAUTOINC+bcb82804da-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2402 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe ltp-20230516-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2403 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_configure)
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ltp-20230516-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 2404 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe cpio-2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2405 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cpio/cpio_2.14.bb:do_configure)
NOTE: recipe cpio-2.14-r0: task do_configure: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2406 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_unpack: Succeeded
NOTE: Running task 2407 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_symlink_kernsrc)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 2408 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.1.bb:do_kernel_checkout)
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_kernel_checkout: Started
NOTE: recipe libaio-0.3.113-r0: task do_package: Succeeded
NOTE: Running task 2409 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_packagedata)
NOTE: recipe gdb-13.1-r0: task do_configure: Succeeded
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Started
NOTE: Running task 2410 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gdb/gdb_13.1.bb:do_compile)
NOTE: recipe gdb-13.1-r0: task do_compile: Started
NOTE: recipe libaio-0.3.113-r0: task do_packagedata: Succeeded
NOTE: Running task 2411 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_create_spdx)
NOTE: Running task 2412 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libaio/libaio_0.3.113.bb:do_package_write_rpm)
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 2413 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe libaio-0.3.113-r0: task do_create_spdx: Succeeded
NOTE: Running task 2414 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/ltp/ltp_20230516.bb:do_collect_spdx_deps)
NOTE: recipe ltp-20230516-r0: task do_collect_spdx_deps: Started
NOTE: recipe ltp-20230516-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: Running task 2415 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_create_spdx)
NOTE: recipe tcp-wrappers-7.6-r10: task do_create_spdx: Started
NOTE: recipe libaio-0.3.113-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_create_spdx: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_configure: Succeeded
NOTE: Running task 2416 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 2417 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 2418 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 2419 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe cronie-1.6.1-r0: task do_configure: Succeeded
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: Running task 2420 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_compile: Started
NOTE: Running task 2421 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe musl-1.2.4+gitAUTOINC+f5f55d6589-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 2422 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe net-tools-2.10-r0: task do_compile: Succeeded
NOTE: Running task 2423 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_compile: Succeeded
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: Running task 2424 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_install)
NOTE: recipe file-5.44-r0: task do_package_write_rpm: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_install: Started
NOTE: recipe cronie-1.6.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2425 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe cronie-1.6.1-r0: task do_install: Succeeded
NOTE: Running task 2426 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package)
NOTE: recipe cronie-1.6.1-r0: task do_package: Started
NOTE: recipe net-tools-2.10-r0: task do_install: Succeeded
NOTE: Running task 2427 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2428 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe net-tools-2.10-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure: Succeeded
NOTE: Running task 2429 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_configure_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 2430 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Started
NOTE: recipe tcl-8.6.13-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 2431 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2432 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe tcl-8.6.13-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2433 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: Running task 2434 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: Running task 2435 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_create_spdx)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2436 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm)
NOTE: Running task 2437 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe which-2.21-r3: task do_create_spdx: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: recipe curl-8.1.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 2438 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe which-2.21-r3: task do_create_spdx: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2439 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure: Succeeded
NOTE: Running task 2440 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_configure_ptest_base)
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2441 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile)
NOTE: recipe cronie-1.6.1-r0: task do_package: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Started
NOTE: Running task 2442 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_packagedata)
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Started
NOTE: recipe iptables-1.8.9-r0: task do_configure: Succeeded
NOTE: Running task 2443 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_compile)
NOTE: recipe iptables-1.8.9-r0: task do_compile: Started
NOTE: recipe cronie-1.6.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2444 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_create_spdx)
NOTE: Running task 2445 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cronie/cronie_1.6.1.bb:do_package_write_rpm)
NOTE: recipe cronie-1.6.1-r0: task do_create_spdx: Started
NOTE: recipe net-tools-2.10-r0: task do_package: Succeeded
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Started
NOTE: Running task 2446 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_packagedata)
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_compile: Succeeded
NOTE: Running task 2447 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_install)
NOTE: recipe cronie-1.6.1-r0: task do_create_spdx: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_packagedata: Succeeded
NOTE: Running task 2448 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_create_spdx)
NOTE: Running task 2449 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/net-tools/net-tools_2.10.bb:do_package_write_rpm)
NOTE: recipe btrfs-tools-6.3-r0: task do_install: Started
NOTE: recipe net-tools-2.10-r0: task do_create_spdx: Started
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Started
NOTE: recipe cronie-1.6.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe net-tools-2.10-r0: task do_create_spdx: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 2450 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2451 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_create_spdx)
NOTE: Running task 2452 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm)
NOTE: recipe bc-1.07.1-r0: task do_create_spdx: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile: Succeeded
NOTE: Running task 2453 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_compile_ptest_base)
NOTE: recipe net-tools-2.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Started
NOTE: Running task 2454 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_create_spdx: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.3-r0: task do_install: Succeeded
NOTE: Running task 2455 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_package)
NOTE: recipe iptables-1.8.9-r0: task do_compile: Succeeded
NOTE: Running task 2456 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_install)
NOTE: recipe iptables-1.8.9-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_package: Started
NOTE: recipe libnl-1_3.7.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2457 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libnl/libnl_3.7.0.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile: Succeeded
NOTE: Running task 2458 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_compile_ptest_base)
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Started
NOTE: recipe iptables-1.8.9-r0: task do_install: Succeeded
NOTE: Running task 2459 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_package)
NOTE: Running task 2460 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_populate_sysroot)
NOTE: recipe iptables-1.8.9-r0: task do_package: Started
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot: Started
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2461 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe iproute2-6.3.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.3.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2462 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_configure)
NOTE: recipe iproute2-6.3.0-r0: task do_configure: Started
NOTE: recipe tcl-8.6.13-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2463 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/tcltk/tcl_8.6.13.bb:do_install)
NOTE: recipe iproute2-6.3.0-r0: task do_configure: Succeeded
NOTE: Running task 2464 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.3.0.bb:do_compile)
NOTE: recipe tcl-8.6.13-r0: task do_install: Started
NOTE: recipe iproute2-6.3.0-r0: task do_compile: Started
NOTE: recipe gzip-1.12-r0: task do_configure: Succeeded
NOTE: Running task 2465 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_configure_ptest_base)
NOTE: recipe gzip-1.12-r0: task do_configure_ptest_base: Started
NOTE: recipe gzip-1.12-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2466 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gzip/gzip_1.12.bb:do_compile)
NOTE: recipe btrfs-tools-6.3-r0: task do_package: Succeeded
NOTE: Running task 2467 of 2602 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata)
NOTE: recipe gzip-1.12-r0: task do_compile: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.3-r0: task do_packagedata: Failed
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe ltp-20230516-r0: task do_configure: Succeeded
NOTE: recipe gzip-1.12-r0: task do_compile: Succeeded
NOTE: recipe libnl-1_3.7.0-r0: task do_install: Succeeded
NOTE: recipe cpio-2.14-r0: task do_configure: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_package: Succeeded
NOTE: recipe diffutils-3.9-r0: task do_configure: Succeeded
NOTE: recipe tar-1.34-r0: task do_configure: Succeeded
NOTE: recipe tcl-8.6.13-r0: task do_install: Succeeded
NOTE: recipe iproute2-6.3.0-r0: task do_compile: Succeeded
NOTE: recipe linux-yocto-6.1.32+gitAUTOINC+fe6f2a4341_24ec2fa877-r0: task do_kernel_checkout: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_configure: Succeeded
NOTE: recipe gdb-13.1-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 2467 tasks of which 2223 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 38 ERROR messages, returning a non-zero exit code.
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-src went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dbg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-ptest went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-gawkbug went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-staticdev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-dev went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-doc went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-bg went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ca went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-da went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-de went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-es went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fi went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-fr went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-id went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-it went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ja went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ko went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ms went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-nl went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pl went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pt went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-pt-br went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-ro went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-sr went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-sv went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-vi went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: QA Issue: Package version for package gawk-locale-zh-cn went backwards which would break package feeds (from 0:5.2.2-r0 to 0:5.2.1-r0) [version-going-backwards]
ERROR: gawk-5.2.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.3.1-r0 to 0:6.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/btrfs-tools/6.3-r0/temp/log.do_packagedata.325707
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.bb:do_packagedata) failed with exit code '1'

--===============1068248349379527986==--

