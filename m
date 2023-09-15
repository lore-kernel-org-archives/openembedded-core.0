Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F037CEE644E
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 18:59:59 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.29470.1694804394218760657
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Sep 2023 11:59:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=TtjzcqKg;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=SHa7Ooij;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018a9a36c57a-e5227117-3b9d-445b-b9f9-c31280139060-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1694804395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=N3Q/xwqKvDVvDNq4BF2l5qXmHlagNsjGb0kIhcs50qs=;
	b=TtjzcqKgGCrSSfmK+zE0t8YW119YZSCn7gd/QrnhaLnF9LsHLd5Y3isQdgk7i7Xx
	MyTFQYvaSehCjyjyoagBpjqkBegk7SrUoj3u5rnv8936r7tUYc05jsTRkLBkHzzOlvh
	sprcq9WXpY0RAhyh/G9yAvfOF7lK/4JoWjcBu3aI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1694804395;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=N3Q/xwqKvDVvDNq4BF2l5qXmHlagNsjGb0kIhcs50qs=;
	b=SHa7OoijCKNl0UoxQWtrnn9bzUGv78behwev2mooFAyhy7EQh+pq+B9CguJNmjzV
	UzwqTdVxlifxiW7hmxPa6w1GabkkkK3pkw+FPYzahAeTTuqy2SUyS9RPV0AHtYSz/jS
	IYnL6zxajSjyYgEOAkMFdZoGvQpsIuzgSVnli460=
Content-Type: multipart/mixed; boundary="===============1922798392480523383=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-tools: upgrading to 2.13.11 SUCCEEDED
Message-ID: <0101018a9a36c57a-e5227117-3b9d-445b-b9f9-c31280139060-000000@us-west-2.amazonses.com>
Date: Fri, 15 Sep 2023 18:59:55 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Sep 2023 18:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187755

--===============1922798392480523383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-tools* to *2.13.11* has Succeeded.

Next steps:
    - apply the patch: git am 0001-lttng-tools-upgrade-2.13.10-2.13.11.patch
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
From 5fa7499e52bb0224e918adf76cc83edbc1f23dd0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Sep 2023 16:49:27 +0000
Subject: [PATCH] lttng-tools: upgrade 2.13.10 -> 2.13.11

---
 .../lttng/{lttng-tools_2.13.10.bb => lttng-tools_2.13.11.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/lttng/{lttng-tools_2.13.10.bb => lttng-tools_2.13.11.bb} (99%)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.10.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
similarity index 99%
rename from meta/recipes-kernel/lttng/lttng-tools_2.13.10.bb
rename to meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
index 20e6375a9b..44415fbf2d 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.13.10.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb
@@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
            file://0001-compat-Define-off64_t-as-off_t-on-linux.patch \
            "
 
-SRC_URI[sha256sum] = "e5d1095ec1322565f38f149346f71967496c281eacc51ec5c77994b850e7d335"
+SRC_URI[sha256sum] = "ac5baeef9fa690936b1ca01ecd1742da762c2c08511ff1b4e923938d94d0f979"
 
 inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
 
-- 
2.39.2


--===============1922798392480523383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1808 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1807 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-a311f16761fb069c56343aec6a25f8ab5d56b16f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a311f16761fb069c56343aec6a25f8ab5d56b16f"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 136 Local 23 Mirrors 0 Missed 113 Current 840 (16% match, 88% complete)
Removing 3 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 860 of 976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1347 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_recipe_qa)
NOTE: Running task 1449 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_recipe_qa)
NOTE: Running task 1552 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_recipe_qa)
NOTE: Running task 1582 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_recipe_qa)
NOTE: Running task 1586 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_recipe_qa)
NOTE: Running task 1602 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_recipe_qa)
NOTE: Running task 1663 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_recipe_qa: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_recipe_qa: Started
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_recipe_qa: Started
NOTE: recipe lttng-tools-2.13.11-r0: task do_recipe_qa: Started
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1665 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_fetch)
NOTE: recipe babeltrace-1.5.11-r0: task do_recipe_qa: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe lttng-tools-2.13.11-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1666 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_fetch)
NOTE: Running task 1667 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_fetch)
NOTE: Running task 1668 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_fetch)
NOTE: Running task 1669 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_fetch)
NOTE: Running task 1670 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_fetch)
NOTE: Running task 1917 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_recipe_qa)
NOTE: Running task 1974 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_recipe_qa)
NOTE: Running task 1975 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_recipe_qa)
NOTE: Running task 1982 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_recipe_qa)
NOTE: Running task 1986 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_recipe_qa)
NOTE: Running task 1997 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_recipe_qa)
NOTE: recipe liburcu-0.14.0-r0: task do_fetch: Started
NOTE: Running task 2015 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_recipe_qa)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_fetch: Started
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Started
NOTE: recipe lttng-tools-2.13.11-r0: task do_fetch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: Running task 2066 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_populate_sysroot)
NOTE: recipe babeltrace-1.5.11-r0: task do_fetch: Started
NOTE: Running task 2110 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_recipe_qa)
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 2134 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_unpack)
NOTE: Running task 2135 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_fetch: Succeeded
NOTE: Running task 2153 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_unpack)
NOTE: Running task 2154 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_unpack)
NOTE: Running task 2155 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_fetch: Started
NOTE: recipe lttng-tools-2.13.11-r0: task do_fetch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_recipe_qa: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_recipe_qa: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_recipe_qa: Started
NOTE: Running task 2156 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_unpack)
NOTE: Running task 2159 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_recipe_qa)
NOTE: recipe grep-3.11-r0: task do_recipe_qa: Started
NOTE: recipe bc-1.07.1-r0: task do_recipe_qa: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_recipe_qa: Started
NOTE: recipe procps-4.0.3-r0: task do_recipe_qa: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_recipe_qa: Started
NOTE: recipe liburcu-0.14.0-r0: task do_unpack: Started
NOTE: Running task 2181 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_unpack)
NOTE: recipe perl-5.38.0-r0: task do_populate_sysroot: Started
NOTE: recipe liburcu-0.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_unpack: Started
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Started
NOTE: Running task 2182 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2204 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_recipe_qa)
NOTE: Running task 2205 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_recipe_qa)
NOTE: Running task 2206 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_recipe_qa)
NOTE: Running task 2207 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_recipe_qa)
NOTE: recipe make-mod-scripts-1.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2405 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_collect_spdx_deps)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_recipe_qa: Succeeded
NOTE: recipe grep-3.11-r0: task do_recipe_qa: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2406 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 2407 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: Running task 2409 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_collect_spdx_deps)
NOTE: recipe bc-1.07.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_unpack: Started
NOTE: Running task 2410 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 2411 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 2412 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_fetch)
NOTE: Running task 2413 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_collect_spdx_deps)
NOTE: recipe lttng-tools-2.13.11-r0: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_recipe_qa: Succeeded
NOTE: Running task 2414 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_fetch)
NOTE: Running task 2415 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_fetch)
NOTE: Running task 2416 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_collect_spdx_deps)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_recipe_qa: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_recipe_qa: Started
NOTE: recipe which-2.21-r3: task do_recipe_qa: Started
NOTE: Running task 2426 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_package_write_rpm)
NOTE: recipe iproute2-6.4.0-r0: task do_recipe_qa: Started
NOTE: Running task 2427 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 2430 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_package_write_rpm)
NOTE: Running task 2431 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package_write_rpm)
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Started
NOTE: recipe binutils-2.41-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: recipe grep-3.11-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Succeeded
NOTE: Running task 2432 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: recipe lttng-modules-2.13.10-r0: task do_fetch: Started
NOTE: Running task 2433 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: Running task 2434 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe procps-4.0.3-r0: task do_fetch: Started
NOTE: recipe coreutils-9.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe grep-3.11-r0: task do_fetch: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Succeeded
NOTE: Running task 2435 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_unpack)
NOTE: Running task 2436 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2437 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_unpack)
NOTE: Running task 2438 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.14.0-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2439 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_patch)
NOTE: Running task 2440 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_collect_spdx_deps)
NOTE: recipe socat-1.7.4.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2441 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: Running task 2442 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: Running task 2443 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_collect_spdx_deps)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: Running task 2444 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 2445 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 2446 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe iproute2-6.4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.41-r0: task do_package_write_rpm: Started
NOTE: Running task 2447 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_recipe_qa: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: recipe grep-3.11-r0: task do_unpack: Started
NOTE: Running task 2448 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_fetch)
NOTE: Running task 2449 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_create_spdx)
NOTE: recipe lttng-modules-2.13.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe kmod-30-r0: task do_package_write_rpm: Started
NOTE: Running task 2450 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_fetch)
NOTE: recipe grep-3.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_unpack: Started
NOTE: Running task 2451 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: Running task 2452 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: Running task 2453 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe gawk-5.2.2-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: Running task 2454 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: recipe procps-4.0.3-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_patch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2455 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: Running task 2456 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_unpack)
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe liburcu-0.14.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gawk-5.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2457 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 2458 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_fetch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: Running task 2459 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: recipe gawk-5.2.2-r0: task do_patch: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_create_spdx: Started
NOTE: recipe iproute2-6.4.0-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2460 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2461 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe coreutils-9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_fetch: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: Running task 2462 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2463 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_create_spdx)
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 2464 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe binutils-2.41-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2465 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_unpack)
NOTE: recipe lttng-modules-2.13.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2466 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe glibc-2.38+git-r0: task do_package_write_rpm: Started
NOTE: Running task 2467 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_patch)
NOTE: Running task 2468 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: Running task 2469 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 2470 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_unpack)
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_unpack: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: Running task 2471 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2472 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2473 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2474 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 2475 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_patch)
NOTE: Running task 2476 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_collect_spdx_deps)
NOTE: recipe sed-4.9-r0: task do_create_spdx: Started
NOTE: recipe liburcu-0.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2477 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_create_spdx)
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 2478 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe grep-3.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2479 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: Running task 2480 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe grep-3.11-r0: task do_unpack: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_create_spdx: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_patch: Started
NOTE: Running task 2481 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: recipe babeltrace-1.5.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.4.0-r0: task do_unpack: Started
NOTE: Running task 2482 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_patch)
NOTE: Running task 2483 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_collect_spdx_deps)
NOTE: recipe iproute2-6.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: Running task 2484 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_patch)
NOTE: Running task 2485 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_collect_spdx_deps)
NOTE: recipe lttng-modules-2.13.10-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_unpack: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2486 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: Running task 2487 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe binutils-2.41-r0: task do_create_spdx: Started
NOTE: recipe lttng-tools-2.13.11-r0: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_patch: Started
NOTE: Running task 2488 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_patch)
NOTE: recipe lttng-modules-2.13.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe grep-3.11-r0: task do_patch: Started
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_patch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2489 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_configure)
NOTE: Running task 2490 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 2491 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_patch_ptest_path)
NOTE: recipe lttng-tools-2.13.11-r0: task do_patch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe grep-3.11-r0: task do_patch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: Running task 2492 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 2493 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_configure)
NOTE: Running task 2494 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_patch)
NOTE: recipe babeltrace-1.5.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2495 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: Running task 2496 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2497 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: Running task 2498 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-modules-2.13.10-r0: task do_patch: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_configure: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_patch_ptest_path: Started
NOTE: Running task 2499 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_deploy_source_date_epoch)
NOTE: recipe grep-3.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_configure: Started
NOTE: recipe iproute2-6.4.0-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: Running task 2500 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 2501 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe procps-4.0.3-r0: task do_unpack: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_patch_ptest_path: Succeeded
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Running task 2502 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_deploy_source_date_epoch)
NOTE: Running task 2503 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_patch)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 5b28f4df3b7a45811ba331aec74ee1e0153bfdd8dbe8eb7a349a0da3250c4fef
NOTE: Running task 2513 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe babeltrace-1.5.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2514 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_configure)
NOTE: Running task 2515 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe grep-3.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-4.0.3-r0: task do_patch: Started
NOTE: Running task 2516 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_configure: Started
NOTE: recipe procps-4.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2517 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_patch: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe grep-3.11-r0: task do_configure: Started
NOTE: Running task 2518 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_patch)
NOTE: Running task 2519 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-tools-2.13.11-r0: task do_patch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: Running task 2520 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: Running task 2521 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 2522 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_populate_lic)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_patch: Started
NOTE: recipe iproute2-6.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 2523 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe lttng-tools-2.13.11-r0: task do_populate_lic: Started
NOTE: Running task 2524 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe lttng-tools-2.13.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2525 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-tools-2.13.11-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_populate_lic unihash changed to 98bf5bee549c70586aae24289fd87a3fc31d37b0b7958fb018c751d37ef6147a
NOTE: recipe procps-4.0.3-r0: task do_patch: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 2526 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_configure)
NOTE: Running task 2527 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2528 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.13.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe iproute2-6.4.0-r0: task do_configure: Started
NOTE: recipe procps-4.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2529 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_configure)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 2530 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe procps-4.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2531 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_configure: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe procps-4.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2532 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_configure)
NOTE: recipe procps-4.0.3-r0: task do_configure: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: recipe kmod-30-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to bbd9eabba2f33064b48fb5e4dcfe60a80e24085bebcd82aaeb2bc06e214d6d13
NOTE: Setscene tasks completed
NOTE: Running task 2537 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2541 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_compile)
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Started
NOTE: recipe iproute2-6.4.0-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Succeeded
NOTE: Running task 2544 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_collect_spdx_deps)
NOTE: recipe procps-4.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe sed-4.9-r0: task do_create_spdx: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 2547 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2548 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2549 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 2550 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe binutils-2.41-r0: task do_create_spdx: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2551 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2552 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2553 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2554 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 2555 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Succeeded
NOTE: Running task 2556 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Succeeded
NOTE: Running task 2557 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 2558 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Succeeded
NOTE: Running task 2559 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Succeeded
NOTE: Running task 2560 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 2561 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 2562 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Succeeded
NOTE: Running task 2563 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 2564 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 2565 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Succeeded
NOTE: Running task 2566 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Succeeded
NOTE: Running task 2567 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2568 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_compile)
NOTE: Running task 2569 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2570 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Started
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: Running task 2571 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 2572 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 2573 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 2574 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: Running task 2575 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2576 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2577 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: Running task 2578 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 2579 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2580 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_unpack: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: Running task 2581 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_symlink_kernsrc)
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_symlink_kernsrc: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 2582 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_kernel_checkout)
NOTE: Running task 2583 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_kernel_checkout: Started
NOTE: Running task 2584 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe iproute2-6.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2585 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_install)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe iproute2-6.4.0-r0: task do_install: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2586 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe iproute2-6.4.0-r0: task do_install: Succeeded
NOTE: Running task 2587 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe iproute2-6.4.0-r0: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2588 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe coreutils-9.4-r0: task do_create_spdx: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 2589 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_compile: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: Running task 2590 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_install)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_package: Succeeded
NOTE: Running task 2591 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_packagedata)
NOTE: recipe iproute2-6.4.0-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_packagedata: Failed
NOTE: recipe btrfs-tools-6.3.3-r0: task do_install: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_configure: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_configure: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_configure: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_configure: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_create_spdx: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe grep-3.11-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_kernel_checkout: Succeeded
NOTE: Tasks Summary: Attempted 2591 tasks of which 2401 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 9 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_packagedata
Summary: There were 21 ERROR messages, returning a non-zero exit code.
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-routel went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/iproute2/6.4.0/temp/log.do_packagedata.1969024
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_packagedata) failed with exit code '1'

--===============1922798392480523383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 70 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2+snapshot-a311f16761fb069c56343aec6a25f8ab5d56b16f"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a311f16761fb069c56343aec6a25f8ab5d56b16f"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 142 Local 29 Mirrors 0 Missed 113 Current 834 (20% match, 88% complete)
Removing 3 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 837 of 976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_package_setscene)
NOTE: Running setscene task 855 of 976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 906 of 976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 955 of 976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 976 of 976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1138 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_recipe_qa)
NOTE: Running task 1190 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_recipe_qa)
NOTE: Running task 1253 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_recipe_qa)
NOTE: Running task 1273 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_recipe_qa)
NOTE: Running task 1275 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_recipe_qa)
NOTE: Running task 1286 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_recipe_qa)
NOTE: Running task 1321 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe glibc-2.38+git-r0: task do_package_setscene: Started
NOTE: Running task 1445 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_recipe_qa)
NOTE: Running task 1481 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_recipe_qa)
NOTE: Running task 1482 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_recipe_qa)
NOTE: Running task 1486 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_recipe_qa)
NOTE: Running task 1488 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_recipe_qa)
NOTE: Running task 1496 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_recipe_qa)
NOTE: Running task 1499 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_recipe_qa)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_recipe_qa: Started
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa: Started
NOTE: Running task 1534 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_recipe_qa)
NOTE: Running task 1542 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_recipe_qa)
NOTE: Running task 1560 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_recipe_qa)
NOTE: Running task 1561 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_recipe_qa)
NOTE: Running task 1562 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_recipe_qa)
NOTE: recipe lttng-tools-2.13.11-r0: task do_recipe_qa: Started
NOTE: Running task 1563 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_recipe_qa)
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_recipe_qa: Started
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_recipe_qa: Started
NOTE: recipe procps-4.0.3-r0: task do_recipe_qa: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_recipe_qa: Started
NOTE: recipe bc-1.07.1-r0: task do_recipe_qa: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_recipe_qa: Started
NOTE: recipe mdadm-4.2-r0: task do_recipe_qa: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_recipe_qa: Started
NOTE: recipe grep-3.11-r0: task do_recipe_qa: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_recipe_qa: Started
NOTE: recipe which-2.21-r3: task do_recipe_qa: Started
NOTE: recipe iproute2-6.4.0-r0: task do_recipe_qa: Started
NOTE: recipe socat-1.7.4.4-r0: task do_recipe_qa: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_recipe_qa: Succeeded
NOTE: recipe lttng-tools-2.13.11-r0: task do_recipe_qa: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1653 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_fetch)
NOTE: Running task 1654 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_fetch)
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1655 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_fetch)
NOTE: Running task 1656 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_fetch)
NOTE: Running task 1657 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_fetch)
NOTE: Running task 1658 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_fetch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1659 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: recipe mdadm-4.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_recipe_qa: Succeeded
NOTE: recipe grep-3.11-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1660 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1661 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 1662 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_fetch)
NOTE: Running task 1663 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_recipe_qa: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_fetch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_fetch: Started
NOTE: Running task 1664 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: recipe iproute2-6.4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_recipe_qa: Succeeded
NOTE: Running task 1665 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_fetch)
NOTE: recipe lttng-tools-2.13.11-r0: task do_fetch: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Succeeded
NOTE: Running task 1666 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_fetch)
NOTE: Running task 1667 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_fetch)
NOTE: Running task 1668 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: recipe liburcu-0.14.0-r0: task do_fetch: Succeeded
NOTE: Running task 1669 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_unpack)
NOTE: Running task 1670 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 1671 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1672 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_unpack)
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: Running task 1673 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_fetch)
NOTE: recipe babeltrace-1.5.11-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_fetch: Succeeded
NOTE: Running task 1674 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_unpack)
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: recipe lttng-tools-2.13.11-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_fetch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: Running task 1675 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_unpack)
NOTE: Running task 1676 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: Running task 1677 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1678 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe grep-3.11-r0: task do_fetch: Started
NOTE: Running task 1679 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_unpack)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_fetch: Started
NOTE: recipe procps-4.0.3-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe grep-3.11-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_unpack: Started
NOTE: recipe iproute2-6.4.0-r0: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_fetch: Started
NOTE: Running task 1680 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1681 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: recipe iproute2-6.4.0-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: Running task 1682 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_unpack)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1683 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: Running task 1684 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 1685 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_unpack)
NOTE: Running task 1686 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_fetch: Succeeded
NOTE: Running task 1687 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: recipe lttng-tools-2.13.11-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1688 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_unpack)
NOTE: Running task 1689 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1690 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_unpack)
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe procps-4.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1691 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: Running task 1692 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_unpack)
NOTE: recipe grep-3.11-r0: task do_unpack: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe iproute2-6.4.0-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: Running task 1693 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_unpack)
NOTE: Running task 1694 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe lttng-modules-2.13.10-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Succeeded
NOTE: Running task 1695 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe procps-4.0.3-r0: task do_unpack: Started
NOTE: recipe liburcu-0.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1696 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: Running task 1697 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1698 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_patch)
NOTE: Running task 1699 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 1700 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1701 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1702 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1703 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe gawk-5.2.2-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_unpack: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_unpack: Succeeded
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1704 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe liburcu-0.14.0-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe iproute2-6.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1705 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1706 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe grep-3.11-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: Running task 1707 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_patch: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_patch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1708 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: Running task 1709 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-modules-2.13.10-r0: task do_patch: Started
NOTE: Running task 1710 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: Running task 1711 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-6.4.0-r0: task do_patch: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_unpack: Succeeded
NOTE: recipe grep-3.11-r0: task do_patch: Started
NOTE: Running task 1712 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_patch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1713 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe grep-3.11-r0: task do_patch: Succeeded
NOTE: Running task 1714 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_patch: Started
NOTE: Running task 1715 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_patch)
NOTE: Running task 1716 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 1717 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: Running task 1718 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe lttng-tools-2.13.11-r0: task do_unpack: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_patch: Started
NOTE: recipe grep-3.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: Running task 1719 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_patch)
NOTE: Running task 1720 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_unpack: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: Running task 1721 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1722 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_patch)
NOTE: recipe liburcu-0.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_patch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1723 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1724 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_patch_ptest_path)
NOTE: recipe lttng-modules-2.13.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1725 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe lttng-tools-2.13.11-r0: task do_patch: Started
NOTE: recipe iproute2-6.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1726 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_patch: Started
NOTE: Running task 1727 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_patch_ptest_path: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to d0ef6662ae372fa27fc72347367b49c49f9a3fa83629e8c158b959f0b7205cdd
NOTE: recipe procps-4.0.3-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe grep-3.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1728 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe lttng-modules-2.13.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_patch_ptest_path: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_patch: Succeeded
NOTE: Running task 1729 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_patch: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1730 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-tools-2.13.11-r0: task do_patch: Succeeded
NOTE: Running task 1731 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1732 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_populate_lic)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 1733 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe lttng-tools-2.13.11-r0: task do_populate_lic: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-tools-2.13.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-4.0.3-r0: task do_patch: Succeeded
NOTE: Running task 1734 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.13.11-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_populate_lic unihash changed to 98bf5bee549c70586aae24289fd87a3fc31d37b0b7958fb018c751d37ef6147a
NOTE: recipe lttng-tools-2.13.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 1735 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 47494d9e181fcc292c328be9c9d3307004fa465e0edc79a25fb3affe9de5dbf5
NOTE: Running task 1736 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 1737 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1738 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2055 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2164 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2196 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2290 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_populate_sysroot)
NOTE: Running task 2325 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gawk-5.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2326 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2347 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe perl-5.38.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2362 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2372 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2377 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2399 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_collect_spdx_deps)
NOTE: Running task 2415 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2477 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2478 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2479 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2509 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_collect_spdx_deps)
NOTE: recipe lttng-modules-2.13.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-4.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2510 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_configure)
NOTE: Running task 2511 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_collect_spdx_deps)
NOTE: recipe liburcu-0.14.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2512 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_collect_spdx_deps)
NOTE: Running task 2513 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_configure)
NOTE: Running task 2515 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_collect_spdx_deps)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburcu-0.14.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2516 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_collect_spdx_deps)
NOTE: Running task 2517 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_collect_spdx_deps)
NOTE: recipe liburcu-0.14.0-r0: task do_configure: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2518 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_collect_spdx_deps)
NOTE: recipe procps-4.0.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2521 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2522 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_collect_spdx_deps)
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe gawk-5.2.2-r0: task do_configure: Started
NOTE: Running task 2530 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_package_write_rpm)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe binutils-2.41-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2531 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: Running task 2532 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_configure)
NOTE: recipe lttng-modules-2.13.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe grep-3.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2533 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: Running task 2538 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package_write_rpm)
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2539 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_configure)
NOTE: Running task 2540 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_package_write_rpm)
NOTE: recipe perl-5.38.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe coreutils-9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2541 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_create_spdx)
NOTE: recipe babeltrace-1.5.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe binutils-2.41-r0: task do_package_write_rpm: Started
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_configure: Started
NOTE: Running task 2542 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe binutils-2.41-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2543 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe iproute2-6.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2544 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_create_spdx)
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe grep-3.11-r0: task do_configure: Started
NOTE: Running task 2545 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_configure)
NOTE: Running task 2546 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_create_spdx)
NOTE: recipe kmod-30-r0: task do_package_write_rpm: Started
NOTE: recipe perl-5.38.0-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.4-r0: task do_create_spdx: Started
NOTE: recipe glibc-2.38+git-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.9-r0: task do_create_spdx: Started
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe binutils-2.41-r0: task do_create_spdx: Started
NOTE: recipe iproute2-6.4.0-r0: task do_configure: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 2547 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2548 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2549 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe procps-4.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_configure: Started
NOTE: recipe procps-4.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2550 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe iproute2-6.4.0-r0: task do_configure: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 2551 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_compile)
NOTE: recipe procps-4.0.3-r0: task do_configure: Started
NOTE: Running task 2552 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe iproute2-6.4.0-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2553 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2554 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 2555 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 2556 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe kmod-30-r0: task do_package_write_rpm: Succeeded
NOTE: recipe sed-4.9-r0: task do_create_spdx: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 2557 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2558 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe binutils-2.41-r0: task do_create_spdx: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2559 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 2560 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2561 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Succeeded
NOTE: Running task 2562 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Succeeded
NOTE: Running task 2563 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Succeeded
NOTE: Running task 2564 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Succeeded
NOTE: Running task 2565 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_unpack: Succeeded
NOTE: Running task 2566 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_symlink_kernsrc)
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_symlink_kernsrc: Started
NOTE: Running task 2567 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 2568 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_kernel_checkout)
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Succeeded
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: Running task 2569 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 2570 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_kernel_checkout: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2571 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2572 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2573 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Succeeded
NOTE: Running task 2574 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Succeeded
NOTE: Running task 2575 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 2576 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Started
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2577 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 2578 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 2579 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2580 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2581 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2582 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Succeeded
NOTE: Running task 2583 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 2584 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2585 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 2586 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2587 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_install)
NOTE: recipe iproute2-6.4.0-r0: task do_install: Started
NOTE: recipe coreutils-9.4-r0: task do_create_spdx: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_install: Succeeded
NOTE: Running task 2588 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_package)
NOTE: recipe iproute2-6.4.0-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 2589 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2590 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2591 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2592 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_compile)
NOTE: recipe liburcu-0.14.0-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_configure: Succeeded
NOTE: Running task 2593 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_configure_ptest_base)
NOTE: recipe babeltrace-1.5.11-r0: task do_configure_ptest_base: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2594 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_compile)
NOTE: recipe babeltrace-1.5.11-r0: task do_compile: Started
NOTE: recipe iproute2-6.4.0-r0: task do_package: Succeeded
NOTE: Running task 2595 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_packagedata)
NOTE: recipe iproute2-6.4.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.4.0-r0: task do_packagedata: Failed
NOTE: recipe procps-4.0.3-r0: task do_configure: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_install: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_package_write_rpm: Succeeded
NOTE: recipe binutils-2.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_compile: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_configure: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_create_spdx: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe grep-3.11-r0: task do_configure: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_compile: Succeeded
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_kernel_checkout: Succeeded
NOTE: Tasks Summary: Attempted 2595 tasks of which 2401 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 8 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_packagedata
Summary: There were 21 ERROR messages, returning a non-zero exit code.
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-routel went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/iproute2/6.4.0/temp/log.do_packagedata.3006630
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_packagedata) failed with exit code '1'

--===============1922798392480523383==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-lttng-tools-upgrade-2.13.10-2.13.11.patch"

RnJvbSA1ZmE3NDk5ZTUyYmIwMjI0ZTkxOGFkZjc2Y2M4M2VkYmMxZjIzZGQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgU2VwIDIwMjMgMTY6NDk6MjcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
dHRuZy10b29sczogdXBncmFkZSAyLjEzLjEwIC0+IDIuMTMuMTEKCi0tLQogLi4uL2x0dG5nL3ts
dHRuZy10b29sc18yLjEzLjEwLmJiID0+IGx0dG5nLXRvb2xzXzIuMTMuMTEuYmJ9ICAgIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUg
bWV0YS9yZWNpcGVzLWtlcm5lbC9sdHRuZy97bHR0bmctdG9vbHNfMi4xMy4xMC5iYiA9PiBsdHRu
Zy10b29sc18yLjEzLjExLmJifSAoOTklKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1rZXJu
ZWwvbHR0bmcvbHR0bmctdG9vbHNfMi4xMy4xMC5iYiBiL21ldGEvcmVjaXBlcy1rZXJuZWwvbHR0
bmcvbHR0bmctdG9vbHNfMi4xMy4xMS5iYgpzaW1pbGFyaXR5IGluZGV4IDk5JQpyZW5hbWUgZnJv
bSBtZXRhL3JlY2lwZXMta2VybmVsL2x0dG5nL2x0dG5nLXRvb2xzXzIuMTMuMTAuYmIKcmVuYW1l
IHRvIG1ldGEvcmVjaXBlcy1rZXJuZWwvbHR0bmcvbHR0bmctdG9vbHNfMi4xMy4xMS5iYgppbmRl
eCAyMGU2Mzc1YTliLi40NDQxNWZiZjJkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMta2VybmVs
L2x0dG5nL2x0dG5nLXRvb2xzXzIuMTMuMTAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWtlcm5lbC9s
dHRuZy9sdHRuZy10b29sc18yLjEzLjExLmJiCkBAIC0zOSw3ICszOSw3IEBAIFNSQ19VUkkgPSAi
aHR0cHM6Ly9sdHRuZy5vcmcvZmlsZXMvbHR0bmctdG9vbHMvbHR0bmctdG9vbHMtJHtQVn0udGFy
LmJ6MiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWNvbXBhdC1EZWZpbmUtb2ZmNjRfdC1hcy1v
ZmZfdC1vbi1saW51eC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1d
ID0gImU1ZDEwOTVlYzEzMjI1NjVmMzhmMTQ5MzQ2ZjcxOTY3NDk2YzI4MWVhY2M1MWVjNWM3Nzk5
NGI4NTBlN2QzMzUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYWM1YmFlZWY5ZmE2OTA5MzZiMWNh
MDFlY2QxNzQyZGE3NjJjMmMwODUxMWZmMWI0ZTkyMzkzOGQ5NGQwZjk3OSIKIAogaW5oZXJpdCBh
dXRvdG9vbHMgcHRlc3QgcGtnY29uZmlnIHVzZXJhZGQgcHl0aG9uMy1kaXIgbWFucGFnZXMgc3lz
dGVtZAogCi0tIAoyLjM5LjIKCg==

--===============1922798392480523383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 50 skipped, 0 masked, 0 errors.
Removing 50 recipes from the core2-32 sysroot...done.
Removing 100 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-a311f16761fb069c56343aec6a25f8ab5d56b16f"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a311f16761fb069c56343aec6a25f8ab5d56b16f"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 577 Local 459 Mirrors 0 Missed 118 Current 328 (79% match, 86% complete)
Removing 1 stale sstate objects for arch allarch...done.
Removing 5 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 329 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 347 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 348 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 349 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 350 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 357 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 358 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 363 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 366 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 367 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 368 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 369 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 372 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 373 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 378 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 402 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_create_spdx_setscene)
NOTE: Running setscene task 403 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 405 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_create_spdx_setscene)
NOTE: Running setscene task 407 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 412 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 415 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 416 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_create_spdx_setscene)
NOTE: Running setscene task 425 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 438 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 454 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_create_spdx_setscene)
NOTE: Running setscene task 455 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 456 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe kmod-30-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 465 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/psmisc/psmisc_23.6.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 466 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 468 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 469 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 470 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_create_spdx_setscene)
NOTE: recipe bash-5.2.15-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 471 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 474 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 478 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 486 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_create_spdx_setscene)
NOTE: Running setscene task 491 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_create_spdx_setscene)
NOTE: recipe libmnl-1.0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 494 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.5.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.2.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 497 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 499 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 512 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 513 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 514 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 515 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 516 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 518 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 519 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 521 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 522 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 523 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running setscene task 524 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 525 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 526 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 528 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 529 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.2.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 530 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 531 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 533 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ca-certificates/ca-certificates_20211016.bb:do_packagedata_setscene)
NOTE: Running setscene task 534 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Started
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 833 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_recipe_qa)
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 537 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: Running task 869 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_recipe_qa)
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 902 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_recipe_qa)
NOTE: Running task 905 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_recipe_qa)
NOTE: Running task 906 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_recipe_qa)
NOTE: Running task 907 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_recipe_qa)
NOTE: recipe shadow-sysroot-4.6-r3: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 538 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 539 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running task 938 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_recipe_qa)
NOTE: Running task 944 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_recipe_qa)
NOTE: Running task 945 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_recipe_qa)
NOTE: Running task 948 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_recipe_qa)
NOTE: Running task 949 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_recipe_qa)
NOTE: Running task 954 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_recipe_qa)
NOTE: Running task 955 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_recipe_qa)
NOTE: Running task 958 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_recipe_qa)
NOTE: recipe findutils-4.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: Running task 986 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_recipe_qa)
NOTE: Running task 989 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_recipe_qa)
NOTE: Running task 1004 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_recipe_qa)
NOTE: Running task 1005 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_recipe_qa)
NOTE: Running task 1006 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_recipe_qa)
NOTE: recipe libcap-2.69-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa: Started
NOTE: recipe e2fsprogs-1.47.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_recipe_qa: Started
NOTE: Running setscene task 545 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 546 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: Running task 1011 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_recipe_qa)
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_recipe_qa: Started
NOTE: recipe lttng-tools-2.13.11-r0: task do_recipe_qa: Started
NOTE: recipe procps-4.0.3-r0: task do_recipe_qa: Started
NOTE: recipe musl-utils-20170421-r0: task do_recipe_qa: Started
NOTE: recipe libpcre2-10.42-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_recipe_qa: Started
NOTE: recipe bc-1.07.1-r0: task do_recipe_qa: Started
NOTE: recipe mdadm-4.2-r0: task do_recipe_qa: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_recipe_qa: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_recipe_qa: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa: Started
NOTE: recipe socat-1.7.4.4-r0: task do_recipe_qa: Started
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_recipe_qa: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_recipe_qa: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_recipe_qa: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_recipe_qa: Started
NOTE: recipe python3-3.11.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 555 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_create_spdx_setscene)
NOTE: recipe util-linux-2.39.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_recipe_qa: Started
NOTE: Running setscene task 558 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 562 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 570 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 571 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 572 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe e2fsprogs-1.47.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 576 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_packagedata_setscene)
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_recipe_qa: Started
NOTE: Running setscene task 578 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package_setscene)
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ca-certificates-20211016-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe popt-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 580 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 582 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 584 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 588 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 591 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.9.bb:do_recipe_qa_setscene)
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_recipe_qa: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe musl-utils-20170421-r0: task do_recipe_qa: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_create_spdx_setscene: Started
NOTE: recipe lttng-tools-2.13.11-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1082 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r90: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe grep-3.11-r0: task do_recipe_qa: Succeeded
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe procps-4.0.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1083 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_fetch)
NOTE: Running task 1084 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_fetch)
NOTE: recipe liberror-perl-0.17029-r1: task do_recipe_qa: Succeeded
NOTE: recipe popt-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1085 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_fetch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_recipe_qa: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 600 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/popt/popt_1.19.bb:do_recipe_qa_setscene)
NOTE: Running task 1086 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_fetch)
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1087 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 1088 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: Running task 1089 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 1090 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_fetch)
NOTE: Running task 1092 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_fetch)
NOTE: Running task 1094 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_fetch)
NOTE: Running task 1095 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: Running task 1097 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1098 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_recipe_qa: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe which-2.21-r3: task do_recipe_qa: Succeeded
NOTE: Running task 1099 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_fetch)
NOTE: recipe gcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 604 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 608 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 610 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 1105 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_fetch)
NOTE: recipe ncurses-6.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 611 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 612 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.2.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 613 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_setscene)
NOTE: recipe coreutils-9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 614 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_package_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 1121 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_fetch)
NOTE: Running task 1122 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_fetch)
NOTE: Running task 1123 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 1124 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: recipe babeltrace-1.5.11-r0: task do_fetch: Started
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iptables-1.8.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_fetch: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_fetch: Started
NOTE: Running setscene task 620 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe musl-utils-20170421-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_fetch: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Started
NOTE: recipe lttng-tools-2.13.11-r0: task do_fetch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Started
NOTE: Running task 1153 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_unpack)
NOTE: Running task 1154 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1155 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: Running task 1156 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_unpack)
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe procps-4.0.3-r0: task do_fetch: Started
NOTE: recipe grep-3.11-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_fetch: Started
NOTE: Running task 1157 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lttng-tools-2.13.11-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Succeeded
NOTE: Running setscene task 623 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 624 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 625 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 627 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe popt-1.19-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: Running task 1159 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_unpack)
NOTE: recipe babeltrace-1.5.11-r0: task do_fetch: Succeeded
NOTE: recipe grep-3.11-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_fetch: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_fetch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: Running task 1165 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_unpack)
NOTE: Running task 1166 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_unpack)
NOTE: Running task 1167 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: Running task 1168 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1169 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_unpack)
NOTE: recipe initscripts-1.0-r155: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iptables-1.8.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_fetch: Started
NOTE: recipe libxml2-2.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: Running task 1179 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_unpack)
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1192 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1193 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1194 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_fetch: Started
NOTE: Running task 1195 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_unpack)
NOTE: recipe procps-4.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 1197 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1198 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 1199 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_unpack: Started
NOTE: recipe liburcu-0.14.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 630 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1200 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_fetch: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 631 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 1201 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_unpack)
NOTE: Running task 1202 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe grep-3.11-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_unpack: Started
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Started
NOTE: Running setscene task 635 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/mpfr/mpfr_4.2.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lttng-tools-2.13.11-r0: task do_unpack: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe iproute2-6.4.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Succeeded
NOTE: Running task 1213 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_fetch: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: Running task 1214 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1215 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: Running task 1216 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: Running task 1217 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe python3-3.11.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 638 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 639 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 641 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_unpack: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Started
NOTE: recipe base-files-3.0.14-r90: task do_unpack: Started
NOTE: Running task 1223 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_patch)
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_fetch: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1224 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_unpack)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_unpack: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 644 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: Running task 1230 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_patch)
NOTE: Running task 1231 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1232 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-30-r0: task do_package_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe sed-4.9-r0: task do_package_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_package_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_package_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_patch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_patch: Started
NOTE: recipe grep-3.11-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1233 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_patch)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1234 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 645 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_create_spdx_setscene)
NOTE: recipe iproute2-6.4.0-r0: task do_unpack: Succeeded
NOTE: Running task 1235 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_patch)
NOTE: Running task 1236 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_patch)
NOTE: recipe mpfr-4.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_unpack: Succeeded
NOTE: Running task 1242 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: Running task 1243 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1244 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1250 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe liburcu-0.14.0-r0: task do_patch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1251 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1252 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe libedit-20230828-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe grep-3.11-r0: task do_patch: Started
NOTE: recipe musl-utils-20170421-r0: task do_fetch: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_patch: Started
NOTE: recipe gawk-5.2.2-r0: task do_patch: Started
NOTE: Running task 1253 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_unpack)
NOTE: recipe python3-3.11.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_patch: Succeeded
NOTE: Running setscene task 650 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 651 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 653 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 654 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 655 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running task 1254 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: Running task 1255 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r90: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r90: task do_collect_spdx_deps: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1256 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_unpack: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_unpack: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1257 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_patch)
NOTE: Running task 1258 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1259 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-utils-20170421-r0: task do_unpack: Started
NOTE: Running setscene task 659 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe grep-3.11-r0: task do_patch: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1260 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_deploy_source_date_epoch)
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 660 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-30-r0: task do_package_setscene: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_collect_spdx_deps: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 661 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1261 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_patch: Succeeded
NOTE: Running task 1263 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: Running task 1264 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_patch: Started
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe grep-3.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe iproute2-6.4.0-r0: task do_patch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1265 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe procps-4.0.3-r0: task do_unpack: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1266 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: Running task 1267 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_patch)
NOTE: recipe liburcu-0.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_configure: Started
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 663 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 665 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 667 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 668 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20230828-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_patch: Succeeded
NOTE: Running setscene task 670 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20230828-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1273 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1274 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_patch_ptest_path)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 674 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe lttng-modules-2.13.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_configure: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1275 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-30-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_patch: Started
NOTE: Running task 1276 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: Running setscene task 676 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_recipe_qa_setscene)
NOTE: recipe lttng-tools-2.13.11-r0: task do_unpack: Succeeded
NOTE: Running task 1277 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_patch)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_patch: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe grep-3.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sed-4.9-r0: task do_package_setscene: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_patch_ptest_path: Started
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 677 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1278 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_deploy_source_date_epoch)
NOTE: recipe base-files-3.0.14-r90: task do_compile: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe musl-utils-20170421-r0: task do_unpack: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1279 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_patch)
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_compile: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1296 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libedit-20230828-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: recipe lttng-tools-2.13.11-r0: task do_patch: Started
NOTE: recipe iproute2-6.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_patch_ptest_path: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_patch: Succeeded
NOTE: Running task 1302 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: Running task 1303 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 681 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-utils-20170421-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe procps-4.0.3-r0: task do_patch: Succeeded
NOTE: Running task 1309 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe sed-4.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 682 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_recipe_qa_setscene)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 683 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_package_setscene)
NOTE: recipe musl-utils-20170421-r0: task do_patch: Succeeded
NOTE: Running task 1310 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_deploy_source_date_epoch)
NOTE: recipe procps-4.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-tools-2.13.11-r0: task do_patch: Succeeded
NOTE: Running task 1316 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1317 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_populate_lic)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe sed-4.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-utils-20170421-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1318 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: Running task 1320 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_fetch)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_package_setscene: Started
NOTE: recipe procps-4.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-tools-2.13.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.13.11-r0: task do_populate_lic: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Started
NOTE: recipe sed-4.9-r0: task do_fetch: Succeeded
NOTE: Running task 1321 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 1322 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe binutils-2.41-r0: task do_package_setscene: Succeeded
NOTE: recipe musl-utils-20170421-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running setscene task 684 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 685 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_populate_sysroot_setscene)
NOTE: recipe lttng-tools-2.13.11-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_populate_lic unihash changed to 98bf5bee549c70586aae24289fd87a3fc31d37b0b7958fb018c751d37ef6147a
NOTE: recipe sed-4.9-r0: task do_unpack: Started
NOTE: recipe lttng-tools-2.13.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe binutils-2.41-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe binutils-2.41-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 687 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.189-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 689 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 690 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 691 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 692 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 694 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.189.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 695 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 698 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 700 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 702 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.0.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1326 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_fetch)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.43.0-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.43.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.41-r0: task do_fetch: Succeeded
NOTE: Running task 1327 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_unpack)
NOTE: recipe elfutils-0.189-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 709 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 711 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 712 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 713 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 714 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 717 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 718 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libmicrohttpd/libmicrohttpd_0.9.77.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 724 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 725 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 728 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: recipe binutils-2.41-r0: task do_unpack: Started
NOTE: Running task 1333 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe sqlite3-3_3.43.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 730 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.43.0.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1334 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe coreutils-9.4-r0: task do_package_setscene: Succeeded
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 731 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.43.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 732 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 733 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.43.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libmicrohttpd-0.9.77-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 736 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_packagedata_setscene)
NOTE: recipe file-5.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 738 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 741 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/file/file_5.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 742 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 743 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 745 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/zstd/zstd_1.5.5.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 747 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: Running setscene task 748 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 750 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.10.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 751 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 752 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 753 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 755 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 756 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 758 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 759 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 761 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/gnutls_3.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 762 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 763 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 764 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 765 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 767 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 770 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 771 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 772 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 775 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.69-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 778 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1386 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_fetch)
NOTE: recipe libgpg-error-1.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 783 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.47-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 786 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.47.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 788 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.9.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libseccomp/libseccomp_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.4-r0: task do_fetch: Started
NOTE: Running setscene task 793 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 794 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 796 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 798 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnutls/libtasn1_4.19.0.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.4-r0: task do_fetch: Succeeded
NOTE: Running task 1392 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_unpack)
NOTE: recipe acl-2.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 801 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 802 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 803 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.69-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 806 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe coreutils-9.4-r0: task do_unpack: Started
NOTE: recipe libgpg-error-1.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.19.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 809 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 1458 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe perl-5.38.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 813 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_package_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe coreutils-9.4-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_package_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 814 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 815 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 816 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 817 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 818 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 819 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 820 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 821 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 822 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 823 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 824 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 85b839d498dd1ce3f45c2bfcf46dab21cfbbb5a924a734c1d92f1e8f6abc858f
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running task 1461 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Started
NOTE: recipe util-linux-2.39.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 827 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 829 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 832 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 834 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 837 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 839 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 840 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 842 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 845 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.41-r0: task do_unpack: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 846 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 847 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 848 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 849 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 850 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 851 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 852 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 853 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 857 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 859 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 861 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 862 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 864 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe perl-5.38.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1500 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_fetch: Started
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_fetch: Succeeded
NOTE: Running task 1516 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 865 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 867 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe perl-5.38.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 869 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 871 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 873 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 874 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 876 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 877 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 878 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 879 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 881 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_unpack: Succeeded
NOTE: Running task 1524 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_patch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_patch: Started
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 885 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 886 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 888 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 893 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 894 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 896 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_patch: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 899 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 900 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_unpack: Succeeded
NOTE: Running task 1565 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_symlink_kernsrc)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 901 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_symlink_kernsrc: Started
NOTE: Running setscene task 903 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 1566 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_kernel_checkout)
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_kernel_checkout: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 905 of 905 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1893 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1894 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1976 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1988 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1998 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2009 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2118 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2119 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2139 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2152 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe perl-5.38.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2161 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe gawk-5.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2165 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_prepare_recipe_sysroot)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2166 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-4.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2181 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_collect_spdx_deps)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2196 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2263 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2264 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2265 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: recipe perl-5.38.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2290 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_configure)
NOTE: Running task 2298 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_collect_spdx_deps)
NOTE: recipe liburcu-0.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe musl-utils-20170421-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2299 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_configure)
NOTE: Running task 2300 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_collect_spdx_deps)
NOTE: recipe liburcu-0.14.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2301 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_collect_spdx_deps)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburcu-0.14.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2302 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_collect_spdx_deps)
NOTE: recipe iproute2-6.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2303 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_collect_spdx_deps)
NOTE: recipe musl-utils-20170421-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2304 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_configure)
NOTE: Running task 2307 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_collect_spdx_deps)
NOTE: recipe lttng-modules-2.13.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_configure: Started
NOTE: recipe liburcu-0.14.0-r0: task do_configure: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2308 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: recipe binutils-2.41-r0: task do_collect_spdx_deps: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 31b247ebdb7eba35fe8dc4d738e9c9dbdbb24b394abee1f0d4bd8e6b4c45013a
NOTE: recipe grep-3.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2315 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe babeltrace-1.5.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2316 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: Running task 2317 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_configure)
NOTE: Running task 2318 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_configure)
NOTE: recipe babeltrace-1.5.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2319 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2320 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_configure)
NOTE: recipe gawk-5.2.2-r0: task do_configure: Started
NOTE: Running task 2321 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_collect_spdx_deps)
NOTE: Running task 2322 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_collect_spdx_deps)
NOTE: recipe musl-utils-20170421-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-utils-20170421-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2323 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_configure)
NOTE: Running task 2324 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_collect_spdx_deps)
NOTE: recipe lttng-modules-2.13.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2332 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_package_write_rpm)
NOTE: recipe babeltrace-1.5.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe procps-4.0.3-r0: task do_configure: Started
NOTE: Running task 2337 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package_write_rpm)
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe grep-3.11-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe binutils-2.41-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2338 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_create_spdx)
NOTE: recipe babeltrace-1.5.11-r0: task do_configure: Started
NOTE: recipe iproute2-6.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2339 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_configure)
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2340 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: Running task 2341 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_create_spdx)
NOTE: recipe procps-4.0.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2342 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx)
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe perl-5.38.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe musl-utils-20170421-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 2343 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe kmod-30-r0: task do_package_write_rpm: Started
NOTE: recipe procps-4.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe binutils-2.41-r0: task do_package_write_rpm: Started
NOTE: recipe binutils-2.41-r0: task do_create_spdx: Started
NOTE: recipe iproute2-6.4.0-r0: task do_configure: Started
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: recipe sed-4.9-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.4-r0: task do_create_spdx: Started
NOTE: Running task 2344 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2345 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2346 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_configure: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe iproute2-6.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2347 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 2348 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe iproute2-6.4.0-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe sed-4.9-r0: task do_create_spdx: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 2349 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 2350 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 2351 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2352 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe kmod-30-r0: task do_package_write_rpm: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe musl-utils-20170421-r0: task do_configure: Succeeded
NOTE: Running task 2353 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_compile)
NOTE: recipe binutils-2.41-r0: task do_create_spdx: Succeeded
NOTE: recipe musl-utils-20170421-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 2354 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe musl-utils-20170421-r0: task do_compile: Succeeded
NOTE: Running task 2355 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_install)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe musl-utils-20170421-r0: task do_install: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe musl-utils-20170421-r0: task do_install: Succeeded
NOTE: Running task 2356 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_package)
NOTE: recipe musl-utils-20170421-r0: task do_package: Started
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 2357 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2358 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_compile)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 2359 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2360 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 2361 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2362 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 2363 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2364 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe musl-utils-20170421-r0: task do_package: Succeeded
NOTE: Running task 2365 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 2366 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe musl-utils-20170421-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2367 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2368 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe musl-utils-20170421-r0: task do_packagedata: Succeeded
NOTE: Running task 2369 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_create_spdx)
NOTE: Running task 2370 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-utils.bb:do_package_write_rpm)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe musl-utils-20170421-r0: task do_create_spdx: Started
NOTE: recipe musl-utils-20170421-r0: task do_package_write_rpm: Started
NOTE: recipe musl-utils-20170421-r0: task do_create_spdx: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2371 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 2372 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 2373 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2374 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe musl-utils-20170421-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe coreutils-9.4-r0: task do_create_spdx: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 2375 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2376 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2377 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_install)
NOTE: recipe iproute2-6.4.0-r0: task do_install: Started
NOTE: recipe iproute2-6.4.0-r0: task do_install: Succeeded
NOTE: Running task 2378 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2379 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe iproute2-6.4.0-r0: task do_package: Started
NOTE: recipe liburcu-0.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2380 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe liburcu-0.14.0-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_configure: Succeeded
NOTE: Running task 2381 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_configure_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_configure_ptest_base: Started
NOTE: recipe procps-4.0.3-r0: task do_configure: Succeeded
NOTE: Running task 2382 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_compile)
NOTE: recipe babeltrace-1.5.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2383 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_compile)
NOTE: recipe procps-4.0.3-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_compile: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_install: Succeeded
NOTE: Running task 2384 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_package)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_package: Started
NOTE: recipe procps-4.0.3-r0: task do_compile: Succeeded
NOTE: Running task 2385 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_install)
NOTE: recipe procps-4.0.3-r0: task do_install: Started
NOTE: recipe iproute2-6.4.0-r0: task do_package: Succeeded
NOTE: Running task 2386 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_packagedata)
NOTE: recipe iproute2-6.4.0-r0: task do_packagedata: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_package: Succeeded
NOTE: Running task 2387 of 2501 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_packagedata)
NOTE: recipe iproute2-6.4.0-r0: task do_packagedata: Failed
NOTE: recipe btrfs-tools-6.3.3-r0: task do_packagedata: Started
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_packagedata: Failed
NOTE: recipe procps-4.0.3-r0: task do_install: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_compile: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_configure: Succeeded
NOTE: recipe binutils-2.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe grep-3.11-r0: task do_configure: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_compile: Succeeded
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_kernel_checkout: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 2387 tasks of which 2170 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 2 tasks failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_packagedata
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_packagedata
Summary: There were 29 ERROR messages, returning a non-zero exit code.
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-routel went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/iproute2/6.4.0/temp/log.do_packagedata.3255836
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_packagedata) failed with exit code '1'
ERROR: btrfs-tools-6.3.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-src went backwards which would break package feeds (from 0:6.5.1-r0 to 0:6.3.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dbg went backwards which would break package feeds (from 0:6.5.1-r0 to 0:6.3.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-staticdev went backwards which would break package feeds (from 0:6.5.1-r0 to 0:6.3.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-dev went backwards which would break package feeds (from 0:6.5.1-r0 to 0:6.3.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-doc went backwards which would break package feeds (from 0:6.5.1-r0 to 0:6.3.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools-locale went backwards which would break package feeds (from 0:6.5.1-r0 to 0:6.3.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3.3-r0 do_packagedata: QA Issue: Package version for package btrfs-tools went backwards which would break package feeds (from 0:6.5.1-r0 to 0:6.3.3-r0) [version-going-backwards]
ERROR: btrfs-tools-6.3.3-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/btrfs-tools/6.3.3/temp/log.do_packagedata.3260552
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_packagedata) failed with exit code '1'

--===============1922798392480523383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 64 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2+snapshot-a311f16761fb069c56343aec6a25f8ab5d56b16f"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a311f16761fb069c56343aec6a25f8ab5d56b16f"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 142 Local 29 Mirrors 0 Missed 113 Current 834 (20% match, 88% complete)
Removing 3 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 837 of 976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_package_setscene)
NOTE: Running setscene task 855 of 976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 906 of 976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 955 of 976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_create_spdx_setscene)
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 976 of 976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1138 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_recipe_qa)
NOTE: Running task 1190 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_recipe_qa)
NOTE: recipe glibc-2.38+git-r0: task do_package_setscene: Started
NOTE: Running task 1253 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_recipe_qa)
NOTE: Running task 1273 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_recipe_qa)
NOTE: Running task 1275 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_recipe_qa)
NOTE: Running task 1286 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_recipe_qa)
NOTE: Running task 1321 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa: Started
NOTE: Running task 1445 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_recipe_qa)
NOTE: Running task 1481 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_recipe_qa)
NOTE: Running task 1482 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_recipe_qa)
NOTE: Running task 1486 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_recipe_qa)
NOTE: Running task 1489 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_recipe_qa)
NOTE: Running task 1496 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_recipe_qa)
NOTE: Running task 1499 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_recipe_qa)
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_recipe_qa: Started
NOTE: Running task 1534 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_recipe_qa)
NOTE: Running task 1542 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_recipe_qa)
NOTE: Running task 1560 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_recipe_qa)
NOTE: Running task 1561 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_recipe_qa)
NOTE: Running task 1562 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_recipe_qa)
NOTE: Running task 1563 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_recipe_qa)
NOTE: recipe babeltrace-1.5.11-r0: task do_recipe_qa: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_recipe_qa: Started
NOTE: recipe lttng-tools-2.13.11-r0: task do_recipe_qa: Started
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe procps-4.0.3-r0: task do_recipe_qa: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_recipe_qa: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_recipe_qa: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_recipe_qa: Started
NOTE: recipe mdadm-4.2-r0: task do_recipe_qa: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_recipe_qa: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa: Started
NOTE: recipe bc-1.07.1-r0: task do_recipe_qa: Started
NOTE: recipe grep-3.11-r0: task do_recipe_qa: Started
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1653 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_fetch)
NOTE: recipe which-2.21-r3: task do_recipe_qa: Started
NOTE: recipe socat-1.7.4.4-r0: task do_recipe_qa: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_recipe_qa: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_recipe_qa: Started
NOTE: Running task 1654 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_fetch)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe lttng-tools-2.13.11-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1655 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_fetch)
NOTE: Running task 1656 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_fetch)
NOTE: recipe babeltrace-1.5.11-r0: task do_recipe_qa: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1657 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_fetch)
NOTE: Running task 1658 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_fetch)
NOTE: recipe iproute2-6.4.0-r0: task do_recipe_qa: Started
NOTE: recipe procps-4.0.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1659 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_fetch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_recipe_qa: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_fetch: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1660 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: Running task 1661 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_fetch)
NOTE: recipe mdadm-4.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_recipe_qa: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1662 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 1663 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_unpack)
NOTE: recipe which-2.21-r3: task do_recipe_qa: Succeeded
NOTE: Running task 1664 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 1665 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: Running task 1666 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: recipe grep-3.11-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1667 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: recipe socat-1.7.4.4-r0: task do_recipe_qa: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1668 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: Running task 1669 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_fetch)
NOTE: Running task 1670 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_fetch)
NOTE: Running task 1671 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_fetch: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_fetch: Started
NOTE: recipe lttng-tools-2.13.11-r0: task do_fetch: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_fetch: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: Running task 1672 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_unpack)
NOTE: recipe iproute2-6.4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_fetch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Succeeded
NOTE: recipe lttng-tools-2.13.11-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_fetch: Succeeded
NOTE: Running task 1673 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_unpack)
NOTE: recipe liburcu-0.14.0-r0: task do_unpack: Started
NOTE: Running task 1674 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_unpack)
NOTE: Running task 1675 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_unpack)
NOTE: Running task 1676 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1677 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_fetch)
NOTE: Running task 1678 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: recipe grep-3.11-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_fetch: Started
NOTE: Running task 1679 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_fetch: Succeeded
NOTE: Running task 1680 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_unpack)
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: Running task 1681 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: Running task 1682 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: recipe grep-3.11-r0: task do_fetch: Succeeded
NOTE: Running task 1683 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_unpack)
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: Running task 1684 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: recipe procps-4.0.3-r0: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: Running task 1685 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_unpack)
NOTE: Running task 1686 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: Running task 1687 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1688 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1689 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_unpack)
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_fetch: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_fetch: Started
NOTE: recipe lttng-tools-2.13.11-r0: task do_unpack: Started
NOTE: Running task 1690 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_unpack)
NOTE: Running task 1691 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: Running task 1692 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_fetch: Succeeded
NOTE: Running task 1693 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: recipe babeltrace-1.5.11-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Started
NOTE: recipe grep-3.11-r0: task do_unpack: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe liburcu-0.14.0-r0: task do_unpack: Succeeded
NOTE: Running task 1694 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_unpack)
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: Running task 1695 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_patch)
NOTE: Running task 1696 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1697 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe procps-4.0.3-r0: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: Running task 1698 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: Running task 1699 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe lttng-modules-2.13.10-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: Running task 1700 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1701 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: recipe liburcu-0.14.0-r0: task do_patch: Started
NOTE: recipe iproute2-6.4.0-r0: task do_unpack: Started
NOTE: Running task 1702 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Started
NOTE: Running task 1703 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_patch)
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: recipe grep-3.11-r0: task do_unpack: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_patch: Started
NOTE: Running task 1704 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1705 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_patch)
NOTE: recipe liburcu-0.14.0-r0: task do_patch: Succeeded
NOTE: Running task 1706 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: Running task 1707 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Succeeded
NOTE: Running task 1708 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: Running task 1709 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe gawk-5.2.2-r0: task do_patch: Started
NOTE: recipe iproute2-6.4.0-r0: task do_unpack: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1710 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_patch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe grep-3.11-r0: task do_patch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1711 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe lttng-modules-2.13.10-r0: task do_patch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_patch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: Running task 1712 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe grep-3.11-r0: task do_patch: Succeeded
NOTE: Running task 1713 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 1714 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1715 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_deploy_source_date_epoch)
NOTE: recipe babeltrace-1.5.11-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_patch: Started
NOTE: Running task 1716 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: Running task 1717 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: recipe lttng-tools-2.13.11-r0: task do_unpack: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 1718 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_patch)
NOTE: recipe grep-3.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1719 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_patch)
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 9493080bb9803e924e9207643fec480cf0b240db3a3e6063b46080b85022abf3
NOTE: recipe lttng-modules-2.13.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: Running task 1720 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1721 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1722 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_patch)
NOTE: recipe liburcu-0.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_unpack: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: Running task 1723 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_patch: Started
NOTE: recipe iproute2-6.4.0-r0: task do_patch: Succeeded
NOTE: recipe lttng-tools-2.13.11-r0: task do_patch: Started
NOTE: recipe procps-4.0.3-r0: task do_patch: Started
NOTE: Running task 1724 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_patch: Started
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe grep-3.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_patch: Succeeded
NOTE: Running task 1725 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1726 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_patch_ptest_path)
NOTE: Running task 1727 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_patch: Succeeded
NOTE: Running task 1728 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_deploy_source_date_epoch)
NOTE: recipe babeltrace-1.5.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_patch_ptest_path: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1729 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe lttng-tools-2.13.11-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_patch: Succeeded
NOTE: Running task 1730 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1731 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_populate_lic)
NOTE: Running task 1732 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-6.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_patch_ptest_path: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_patch: Succeeded
NOTE: Running task 1733 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_deploy_source_date_epoch)
NOTE: recipe babeltrace-1.5.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe lttng-tools-2.13.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-4.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.13.11-r0: task do_populate_lic: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.13.11-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_populate_lic unihash changed to 98bf5bee549c70586aae24289fd87a3fc31d37b0b7958fb018c751d37ef6147a
NOTE: recipe btrfs-tools-6.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-tools-2.13.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: Running task 1734 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1735 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5c46eaaea9a95ec3cdfae4336e00821ada1f410bba53862e1d7f98f1b5ab10f8
NOTE: Running task 1736 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 1737 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1738 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2055 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2164 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2196 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2290 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_populate_sysroot)
NOTE: Running task 2325 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2326 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2347 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2363 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2372 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe babeltrace-1.5.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2373 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_configure)
NOTE: Running task 2378 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2400 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_collect_spdx_deps)
NOTE: Running task 2416 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: recipe perl-5.38.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2478 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2479 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2480 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe procps-4.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2511 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_collect_spdx_deps)
NOTE: recipe liburcu-0.14.0-r0: task do_configure: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburcu-0.14.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2512 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_collect_spdx_deps)
NOTE: recipe gawk-5.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2513 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_configure)
NOTE: Running task 2514 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_collect_spdx_deps)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: recipe iproute2-6.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2516 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_collect_spdx_deps)
NOTE: recipe liburcu-0.14.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2517 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_collect_spdx_deps)
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2519 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_collect_spdx_deps)
NOTE: recipe procps-4.0.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2520 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_collect_spdx_deps)
NOTE: recipe babeltrace-1.5.11-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2521 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_collect_spdx_deps)
NOTE: recipe gawk-5.2.2-r0: task do_configure: Started
NOTE: recipe perl-5.38.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2522 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_collect_spdx_deps)
NOTE: Running task 2523 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_configure)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2524 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: recipe grep-3.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2525 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: Running task 2536 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_package_write_rpm)
NOTE: recipe binutils-2.41-r0: task do_collect_spdx_deps: Started
NOTE: recipe perl-5.38.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2537 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_configure)
NOTE: Running task 2539 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package_write_rpm)
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2540 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_create_spdx)
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2541 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: Running task 2542 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_package_write_rpm)
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe iproute2-6.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2543 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_configure)
NOTE: recipe babeltrace-1.5.11-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe grep-3.11-r0: task do_configure: Started
NOTE: recipe binutils-2.41-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2544 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_create_spdx)
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe binutils-2.41-r0: task do_package_write_rpm: Started
NOTE: recipe kmod-30-r0: task do_package_write_rpm: Started
NOTE: Running task 2545 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_create_spdx)
NOTE: Running task 2546 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx)
NOTE: recipe perl-5.38.0-r0: task do_create_spdx: Started
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 2547 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe glibc-2.38+git-r0: task do_package_write_rpm: Started
NOTE: recipe iproute2-6.4.0-r0: task do_configure: Started
NOTE: recipe binutils-2.41-r0: task do_create_spdx: Started
NOTE: recipe sed-4.9-r0: task do_create_spdx: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2548 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe coreutils-9.4-r0: task do_create_spdx: Started
NOTE: recipe procps-4.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2549 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_configure)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2550 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe procps-4.0.3-r0: task do_configure: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_configure: Started
NOTE: recipe iproute2-6.4.0-r0: task do_configure: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 2551 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_compile)
NOTE: Running task 2552 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2553 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe iproute2-6.4.0-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2554 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 2555 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 2556 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe kmod-30-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 2557 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sed-4.9-r0: task do_create_spdx: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2558 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe binutils-2.41-r0: task do_create_spdx: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2559 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 2560 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2561 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Succeeded
NOTE: Running task 2562 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Succeeded
NOTE: Running task 2563 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Succeeded
NOTE: Running task 2564 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Succeeded
NOTE: Running task 2565 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_unpack: Succeeded
NOTE: Running task 2566 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_symlink_kernsrc)
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Started
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: Running task 2567 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_symlink_kernsrc: Succeeded
NOTE: Running task 2568 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_kernel_checkout)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_kernel_checkout: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_configure: Succeeded
NOTE: Running task 2569 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Succeeded
NOTE: Running task 2570 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_compile: Started
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: Running task 2571 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 2572 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2573 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 2574 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Started
NOTE: Running task 2575 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: Running task 2576 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 2577 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: Running task 2578 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 2579 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2580 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2581 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: Running task 2582 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: Running task 2583 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Succeeded
NOTE: Running task 2584 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Started
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2585 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: Running task 2586 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Succeeded
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe coreutils-9.4-r0: task do_create_spdx: Succeeded
NOTE: recipe binutils-2.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2587 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_install)
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 2588 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe iproute2-6.4.0-r0: task do_install: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_install: Succeeded
NOTE: Running task 2589 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_package)
NOTE: recipe iproute2-6.4.0-r0: task do_package: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2590 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_install: Started
NOTE: Running task 2591 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe liburcu-0.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2592 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_compile)
NOTE: recipe liburcu-0.14.0-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_configure: Succeeded
NOTE: Running task 2593 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_configure_ptest_base)
NOTE: recipe babeltrace-1.5.11-r0: task do_configure_ptest_base: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2594 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_compile)
NOTE: recipe babeltrace-1.5.11-r0: task do_compile: Started
NOTE: recipe glibc-2.38+git-r0: task do_package_write_rpm: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_configure: Succeeded
NOTE: Running task 2595 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_compile)
NOTE: recipe procps-4.0.3-r0: task do_compile: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_install: Succeeded
NOTE: Running task 2596 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_package)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_package: Started
NOTE: recipe iproute2-6.4.0-r0: task do_package: Succeeded
NOTE: Running task 2597 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_packagedata)
NOTE: recipe iproute2-6.4.0-r0: task do_packagedata: Started
NOTE: recipe iproute2-6.4.0-r0: task do_packagedata: Failed
NOTE: recipe procps-4.0.3-r0: task do_compile: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_package: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_compile: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_configure: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_create_spdx: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_compile: Succeeded
NOTE: recipe grep-3.11-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_kernel_checkout: Succeeded
NOTE: Tasks Summary: Attempted 2597 tasks of which 2401 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 8 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_packagedata
Summary: There were 21 ERROR messages, returning a non-zero exit code.
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-routel went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/iproute2/6.4.0/temp/log.do_packagedata.2728876
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_packagedata) failed with exit code '1'

--===============1922798392480523383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 54 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2+snapshot-a311f16761fb069c56343aec6a25f8ab5d56b16f"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a311f16761fb069c56343aec6a25f8ab5d56b16f"
workspace            = "master:de863bc1fa44b5ed7ad2b00abfcdd45db1f51fe2"

Initialising tasks...done.
Sstate summary: Wanted 142 Local 29 Mirrors 0 Missed 113 Current 834 (20% match, 88% complete)
Removing 3 stale sstate objects for arch qemuarm...done.
NOTE: Executing Tasks
NOTE: Running setscene task 837 of 976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_package_setscene)
NOTE: Running setscene task 855 of 976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 906 of 976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 955 of 976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_create_spdx_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 976 of 976 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1134 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_recipe_qa)
NOTE: Running task 1186 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_recipe_qa)
NOTE: Running task 1249 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_recipe_qa)
NOTE: Running task 1269 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_recipe_qa)
NOTE: Running task 1270 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_recipe_qa)
NOTE: Running task 1282 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_recipe_qa)
NOTE: Running task 1317 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1441 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_recipe_qa)
NOTE: Running task 1477 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_recipe_qa)
NOTE: Running task 1478 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_recipe_qa)
NOTE: Running task 1482 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_recipe_qa)
NOTE: Running task 1485 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_recipe_qa)
NOTE: Running task 1492 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_recipe_qa)
NOTE: Running task 1495 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_recipe_qa)
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa: Started
NOTE: Running task 1528 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_recipe_qa)
NOTE: Running task 1538 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_recipe_qa)
NOTE: Running task 1556 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_recipe_qa)
NOTE: Running task 1557 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_recipe_qa)
NOTE: Running task 1558 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_recipe_qa)
NOTE: Running task 1559 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_recipe_qa)
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_recipe_qa: Started
NOTE: recipe attr-2.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_recipe_qa: Started
NOTE: recipe lttng-tools-2.13.11-r0: task do_recipe_qa: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_recipe_qa: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_recipe_qa: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_recipe_qa: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa: Started
NOTE: recipe bc-1.07.1-r0: task do_recipe_qa: Started
NOTE: recipe mdadm-4.2-r0: task do_recipe_qa: Started
NOTE: recipe procps-4.0.3-r0: task do_recipe_qa: Started
NOTE: recipe grep-3.11-r0: task do_recipe_qa: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_recipe_qa: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_recipe_qa: Started
NOTE: recipe socat-1.7.4.4-r0: task do_recipe_qa: Started
NOTE: recipe which-2.21-r3: task do_recipe_qa: Started
NOTE: recipe iproute2-6.4.0-r0: task do_recipe_qa: Started
NOTE: recipe glibc-2.38+git-r0: task do_package_setscene: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_recipe_qa: Started
NOTE: recipe liburcu-0.14.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1653 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_fetch)
NOTE: recipe lttng-tools-2.13.11-r0: task do_recipe_qa: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_recipe_qa: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1654 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_fetch)
NOTE: recipe babeltrace-1.5.11-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1655 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_fetch)
NOTE: Running task 1656 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_fetch)
NOTE: Running task 1657 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_fetch)
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_recipe_qa: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1658 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_fetch)
NOTE: recipe liberror-perl-0.17029-r1: task do_recipe_qa: Succeeded
NOTE: recipe grep-3.11-r0: task do_recipe_qa: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1659 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_fetch)
NOTE: recipe mdadm-4.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_recipe_qa: Succeeded
NOTE: Running task 1660 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 1661 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_fetch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1662 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_fetch)
NOTE: Running task 1663 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_fetch)
NOTE: recipe procps-4.0.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1664 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_fetch)
NOTE: Running task 1665 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_fetch)
NOTE: Running task 1666 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_fetch)
NOTE: Running task 1667 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_fetch)
NOTE: Running task 1668 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_fetch)
NOTE: recipe liburcu-0.14.0-r0: task do_fetch: Started
NOTE: recipe which-2.21-r3: task do_recipe_qa: Succeeded
NOTE: recipe lttng-tools-2.13.11-r0: task do_fetch: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_fetch: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Started
NOTE: Running task 1669 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_fetch)
NOTE: recipe iproute2-6.4.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_fetch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_fetch: Succeeded
NOTE: Running task 1670 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_fetch)
NOTE: Running task 1671 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_unpack)
NOTE: Running task 1672 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_fetch)
NOTE: recipe gawk-5.2.2-r0: task do_fetch: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_fetch: Succeeded
NOTE: recipe lttng-tools-2.13.11-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: Running task 1673 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_unpack)
NOTE: Running task 1674 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_unpack)
NOTE: Running task 1675 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_unpack)
NOTE: recipe lttng-modules-2.13.10-r0: task do_fetch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Started
NOTE: recipe bc-1.07.1-r0: task do_fetch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Started
NOTE: recipe procps-4.0.3-r0: task do_fetch: Started
NOTE: recipe grep-3.11-r0: task do_fetch: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_fetch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_fetch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_fetch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Succeeded
NOTE: Running task 1676 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_unpack)
NOTE: recipe socat-1.7.4.4-r0: task do_fetch: Succeeded
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_fetch: Started
NOTE: Running task 1677 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_unpack)
NOTE: Running task 1678 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1679 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: recipe babeltrace-1.5.11-r0: task do_fetch: Succeeded
NOTE: Running task 1680 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_unpack)
NOTE: Running task 1681 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_unpack)
NOTE: Running task 1682 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_unpack)
NOTE: recipe grep-3.11-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_fetch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_unpack: Started
NOTE: recipe iproute2-6.4.0-r0: task do_fetch: Started
NOTE: Running task 1683 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_unpack)
NOTE: Running task 1684 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_unpack)
NOTE: recipe mdadm-4.2-r0: task do_fetch: Succeeded
NOTE: recipe which-2.21-r3: task do_fetch: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_unpack: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_fetch: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_fetch: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Started
NOTE: Running task 1685 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_unpack)
NOTE: Running task 1686 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_unpack)
NOTE: recipe lttng-tools-2.13.11-r0: task do_unpack: Started
NOTE: Running task 1687 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_unpack)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: Running task 1688 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_unpack)
NOTE: recipe procps-4.0.3-r0: task do_fetch: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 1689 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_unpack)
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Started
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_unpack: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_fetch: Succeeded
NOTE: Running task 1690 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_patch)
NOTE: recipe grep-3.11-r0: task do_unpack: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1691 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_unpack)
NOTE: Running task 1692 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Started
NOTE: Running task 1693 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: recipe which-2.21-r3: task do_unpack: Started
NOTE: recipe mdadm-4.2-r0: task do_unpack: Started
NOTE: recipe iproute2-6.4.0-r0: task do_unpack: Started
NOTE: recipe procps-4.0.3-r0: task do_unpack: Started
NOTE: recipe bc-1.07.1-r0: task do_unpack: Succeeded
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_fetch: Succeeded
NOTE: Running task 1694 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_patch)
NOTE: Running task 1695 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_unpack)
NOTE: Running task 1696 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe which-2.21-r3: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_unpack: Succeeded
NOTE: Running task 1697 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_patch)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_unpack: Started
NOTE: recipe gawk-5.2.2-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Started
NOTE: Running task 1698 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_patch)
NOTE: recipe socat-1.7.4.4-r0: task do_unpack: Succeeded
NOTE: Running task 1699 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_patch)
NOTE: Running task 1700 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_patch)
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 1701 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1702 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_patch: Started
NOTE: recipe liburcu-0.14.0-r0: task do_unpack: Succeeded
NOTE: recipe grep-3.11-r0: task do_unpack: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_unpack: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_patch: Succeeded
NOTE: Running task 1703 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_patch)
NOTE: Running task 1704 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_patch)
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_unpack: Started
NOTE: Running task 1705 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_patch)
NOTE: Running task 1706 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_patch: Started
NOTE: recipe gawk-5.2.2-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_patch: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: Running task 1707 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liburcu-0.14.0-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_unpack: Succeeded
NOTE: recipe grep-3.11-r0: task do_patch: Started
NOTE: Running task 1708 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_patch)
NOTE: recipe gawk-5.2.2-r0: task do_patch: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_patch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Started
NOTE: Running task 1709 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_deploy_source_date_epoch)
NOTE: recipe socat-1.7.4.4-r0: task do_patch: Succeeded
NOTE: Running task 1710 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe grep-3.11-r0: task do_patch: Succeeded
NOTE: Running task 1711 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1712 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_unpack: Succeeded
NOTE: Running task 1713 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_patch)
NOTE: recipe liburcu-0.14.0-r0: task do_patch: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_unpack: Succeeded
NOTE: Running task 1714 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_unpack: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1715 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_patch)
NOTE: Running task 1716 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_patch)
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_patch: Succeeded
NOTE: recipe grep-3.11-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1717 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_deploy_source_date_epoch)
NOTE: recipe which-2.21-r3: task do_patch: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Started
NOTE: Running task 1718 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_deploy_source_date_epoch)
NOTE: recipe procps-4.0.3-r0: task do_unpack: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_patch: Started
NOTE: Running task 1719 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_patch)
NOTE: recipe bc-1.07.1-r0: task do_patch: Succeeded
NOTE: Running task 1720 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_deploy_source_date_epoch)
NOTE: recipe babeltrace-1.5.11-r0: task do_patch: Started
NOTE: recipe make-mod-scripts-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_unpack: Succeeded
NOTE: Running task 1721 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_patch: Succeeded
NOTE: Running task 1722 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_deploy_source_date_epoch)
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to bbed31d8c22a06808d37b4890d92fb48e12c87ded35bea0d18c00e01704fdf4b
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1723 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_configure)
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_patch: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_patch: Started
NOTE: Running task 1724 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1725 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_patch_ptest_path)
NOTE: recipe gawk-5.2.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-tools-2.13.11-r0: task do_unpack: Succeeded
NOTE: Running task 1726 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_patch)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_patch: Started
NOTE: recipe grep-3.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe liburcu-0.14.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_patch_ptest_path: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-tools-2.13.11-r0: task do_patch: Started
NOTE: recipe which-2.21-r3: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 1727 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_patch_ptest_path: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_patch: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_patch: Succeeded
NOTE: Running task 1728 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1729 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-ust_2.13.6.bb:do_deploy_source_date_epoch)
NOTE: recipe iproute2-6.4.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_patch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: Running task 1730 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 1731 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_install)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe procps-4.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe lttng-tools-2.13.11-r0: task do_patch: Succeeded
NOTE: Running task 1732 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_deploy_source_date_epoch)
NOTE: Running task 1733 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_populate_lic)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-ust-2_2.13.6-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe lttng-tools-2.13.11-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe lttng-tools-2.13.11-r0: task do_populate_lic: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1734 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe lttng-tools-2.13.11-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-tools_2.13.11.bb:do_populate_lic unihash changed to 98bf5bee549c70586aae24289fd87a3fc31d37b0b7958fb018c751d37ef6147a
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe lttng-tools-2.13.11-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 1735 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 74767825f4c36d5bdaa875783dc6b2eb411b129256d8a55c59fc108cf1e64ed1
NOTE: Running task 1736 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Started
NOTE: recipe base-files-3.0.14-r90: task do_create_spdx: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_patch: Succeeded
NOTE: Running task 1737 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_deploy_source_date_epoch)
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_patch: Succeeded
NOTE: Running task 1738 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_deploy_source_date_epoch)
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Started
NOTE: recipe mdadm-4.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glibc-2.38+git-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2055 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2163 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2196 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2290 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_populate_sysroot)
NOTE: Running task 2325 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2326 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2347 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe liburcu-0.14.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2363 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2370 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2376 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_prepare_recipe_sysroot)
NOTE: recipe gawk-5.2.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2400 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_collect_spdx_deps)
NOTE: recipe babeltrace-1.5.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2413 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2477 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe perl-5.38.0-r0: task do_populate_sysroot: Started
NOTE: Running task 2478 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2479 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2509 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_collect_spdx_deps)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe procps-4.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe grep-3.11-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2510 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_collect_spdx_deps)
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lttng-modules-2.13.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2512 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_collect_spdx_deps)
NOTE: recipe liburcu-0.14.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2513 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/lttng-modules_2.13.10.bb:do_collect_spdx_deps)
NOTE: Running task 2514 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_collect_spdx_deps)
NOTE: recipe iproute2-6.4.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2517 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_collect_spdx_deps)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2518 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_collect_spdx_deps)
NOTE: recipe liburcu-0.14.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2519 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_configure)
NOTE: recipe babeltrace-1.5.11-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2520 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.2.bb:do_configure)
NOTE: recipe binutils-2.41-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2521 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_collect_spdx_deps)
NOTE: recipe bc-1.07.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2522 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_collect_spdx_deps)
NOTE: recipe make-mod-scripts-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2523 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure)
NOTE: Running task 2530 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_package_write_rpm)
NOTE: Running task 2536 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_package_write_rpm)
NOTE: recipe tcp-wrappers-7.6-r10: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe lttng-modules-2.13.10-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2537 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_package_write_rpm)
NOTE: recipe grep-3.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe babeltrace-1.5.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2538 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.11.bb:do_configure)
NOTE: recipe coreutils-9.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2539 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_configure)
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2540 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_configure)
NOTE: recipe lttng-modules-2.13.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_configure: Started
NOTE: recipe gawk-5.2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_configure: Started
NOTE: recipe perl-5.38.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe which-2.21-r3: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2541 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_configure)
NOTE: recipe binutils-2.41-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure: Started
NOTE: recipe grep-3.11-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2542 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.41.bb:do_create_spdx)
NOTE: recipe iproute2-6.4.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe kmod-30-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe binutils-2.41-r0: task do_package_write_rpm: Started
NOTE: Running task 2543 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_configure)
NOTE: recipe grep-3.11-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Started
NOTE: recipe coreutils-9.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2544 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_create_spdx)
NOTE: recipe babeltrace-1.5.11-r0: task do_configure: Started
NOTE: recipe glibc-2.38+git-r0: task do_package_write_rpm: Started
NOTE: Running task 2545 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_create_spdx)
NOTE: Running task 2546 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.38.0.bb:do_create_spdx)
NOTE: recipe which-2.21-r3: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_configure: Succeeded
NOTE: Running task 2547 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_compile)
NOTE: recipe binutils-2.41-r0: task do_create_spdx: Started
NOTE: recipe iproute2-6.4.0-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_create_spdx: Started
NOTE: recipe perl-5.38.0-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.4-r0: task do_create_spdx: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2548 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2549 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure)
NOTE: recipe procps-4.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_configure: Started
NOTE: recipe procps-4.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2550 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_4.0.3.bb:do_configure)
NOTE: recipe mdadm-4.2-r0: task do_configure: Started
NOTE: recipe procps-4.0.3-r0: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_compile: Succeeded
NOTE: Running task 2551 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_install)
NOTE: recipe iproute2-6.4.0-r0: task do_configure: Succeeded
NOTE: Running task 2552 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_compile)
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_configure: Succeeded
NOTE: Running task 2553 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_configure_ptest_base)
NOTE: recipe iproute2-6.4.0-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Started
NOTE: recipe mdadm-4.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2554 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile)
NOTE: recipe mdadm-4.2-r0: task do_compile: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_install: Succeeded
NOTE: Running task 2555 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_populate_sysroot)
NOTE: Running task 2556 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package)
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Started
NOTE: recipe kmod-30-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_populate_sysroot: Succeeded
NOTE: Running task 2557 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe socat-1.7.4.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2558 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.4.bb:do_configure)
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_create_spdx: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 2559 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe binutils-2.41-r0: task do_create_spdx: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2560 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: recipe tcp-wrappers-7.6-r10: task do_package: Succeeded
NOTE: Running task 2561 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Succeeded
NOTE: Running task 2562 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Succeeded
NOTE: Running task 2563 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_unpack: Succeeded
NOTE: Running task 2564 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_symlink_kernsrc)
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Succeeded
NOTE: Running task 2565 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_symlink_kernsrc: Started
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_symlink_kernsrc: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Started
NOTE: Running task 2566 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_6.4.bb:do_kernel_checkout)
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Succeeded
NOTE: Running task 2567 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_kernel_checkout: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Succeeded
NOTE: Running task 2568 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_compile: Succeeded
NOTE: Running task 2569 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_compile_ptest_base)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Started
NOTE: recipe btrfs-tools-6.3.3-r0: task do_configure: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Started
NOTE: Running task 2570 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Succeeded
NOTE: Running task 2571 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe which-2.21-r3: task do_configure: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_compile: Started
NOTE: Running task 2572 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_compile)
NOTE: recipe bc-1.07.1-r0: task do_configure: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Started
NOTE: Running task 2573 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_configure_ptest_base)
NOTE: recipe which-2.21-r3: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Started
NOTE: Running task 2574 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2575 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Started
NOTE: recipe mdadm-4.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 2576 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install)
NOTE: recipe mdadm-4.2-r0: task do_install: Started
NOTE: recipe which-2.21-r3: task do_compile: Succeeded
NOTE: Running task 2577 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_install)
NOTE: recipe which-2.21-r3: task do_install: Started
NOTE: recipe which-2.21-r3: task do_install: Succeeded
NOTE: Running task 2578 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package)
NOTE: recipe which-2.21-r3: task do_package: Started
NOTE: recipe mdadm-4.2-r0: task do_install: Succeeded
NOTE: Running task 2579 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_install_ptest_base)
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile: Succeeded
NOTE: Running task 2580 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_compile_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Started
NOTE: recipe bc-1.07.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe mdadm-4.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2581 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install)
NOTE: Running task 2582 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Succeeded
NOTE: Running task 2583 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_install: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Succeeded
NOTE: Running task 2584 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_install_ptest_base)
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Started
NOTE: recipe which-2.21-r3: task do_package: Succeeded
NOTE: Running task 2585 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata)
NOTE: recipe which-2.21-r3: task do_packagedata: Started
NOTE: recipe bc-1.07.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 2586 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package)
NOTE: recipe bc-1.07.1-r0: task do_package: Started
NOTE: recipe which-2.21-r3: task do_packagedata: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_compile: Succeeded
NOTE: Running task 2587 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_install)
NOTE: recipe iproute2-6.4.0-r0: task do_install: Started
NOTE: recipe iproute2-6.4.0-r0: task do_install: Succeeded
NOTE: Running task 2588 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_package)
NOTE: recipe iproute2-6.4.0-r0: task do_package: Started
NOTE: recipe coreutils-9.4-r0: task do_create_spdx: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package: Succeeded
NOTE: Running task 2589 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata)
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Started
NOTE: recipe glibc-2.38+git-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_compile: Succeeded
NOTE: Running task 2590 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_6.3.3.bb:do_install)
NOTE: recipe btrfs-tools-6.3.3-r0: task do_install: Started
NOTE: recipe mdadm-4.2-r0: task do_package: Succeeded
NOTE: Running task 2591 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.2.bb:do_packagedata)
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Started
NOTE: recipe mdadm-4.2-r0: task do_packagedata: Succeeded
NOTE: recipe iproute2-6.4.0-r0: task do_package: Succeeded
NOTE: Running task 2592 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_packagedata)
NOTE: recipe iproute2-6.4.0-r0: task do_packagedata: Started
NOTE: recipe liburcu-0.14.0-r0: task do_configure: Succeeded
NOTE: Running task 2593 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/liburcu/liburcu_0.14.0.bb:do_compile)
NOTE: recipe babeltrace-1.5.11-r0: task do_configure: Succeeded
NOTE: Running task 2594 of 2693 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/lttng/babeltrace_1.5.11.bb:do_configure_ptest_base)
NOTE: recipe liburcu-0.14.0-r0: task do_compile: Started
NOTE: recipe babeltrace-1.5.11-r0: task do_configure_ptest_base: Started
NOTE: recipe iproute2-6.4.0-r0: task do_packagedata: Failed
NOTE: recipe babeltrace-1.5.11-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe btrfs-tools-6.3.3-r0: task do_install: Succeeded
NOTE: recipe procps-4.0.3-r0: task do_configure: Succeeded
NOTE: recipe binutils-2.41-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gawk-5.2.2-r0: task do_configure: Succeeded
NOTE: recipe liburcu-0.14.0-r0: task do_compile: Succeeded
NOTE: recipe socat-1.7.4.4-r0: task do_configure: Succeeded
NOTE: recipe perl-5.38.0-r0: task do_create_spdx: Succeeded
NOTE: recipe grep-3.11-r0: task do_configure: Succeeded
NOTE: recipe linux-yocto-6.4.14+git-r0: task do_kernel_checkout: Succeeded
NOTE: Tasks Summary: Attempted 2594 tasks of which 2401 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 10 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_packagedata
Summary: There were 21 ERROR messages, returning a non-zero exit code.
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-src went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dbg went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-staticdev went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-dev went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-doc went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-locale went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-devlink went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-genl went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ifstat went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ip went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-lnstat went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-nstat went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-routel went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rtacct went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-ss went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tc went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-tipc went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-rdma went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2 went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: QA Issue: Package version for package iproute2-bash-completion went backwards which would break package feeds (from 0:6.5.0-r0 to 0:6.4.0-r0) [version-going-backwards]
ERROR: iproute2-6.4.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/iproute2/6.4.0/temp/log.do_packagedata.2384529
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_6.4.0.bb:do_packagedata) failed with exit code '1'

--===============1922798392480523383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/lttng-tools: PKGV changed from 2.13.10 [default] to 2.13.11 [default]
packages/core2-32-poky-linux/lttng-tools: SRC_URI changed from "https://lttng.org/files/lttng-tools/lttng-tools-2.13.10.tar.bz2 file://0001-tests-do-not-strip-a-helper-library.patch file://run-ptest file://lttng-sessiond.service file://disable-tests.patch file://0001-compat-Define-off64_t-as-off_t-on-linux.patch" to "https://lttng.org/files/lttng-tools/lttng-tools-2.13.11.tar.bz2 file://0001-tests-do-not-strip-a-helper-library.patch file://run-ptest file://lttng-sessiond.service file://disable-tests.patch file://0001-compat-Define-off64_t-as-off_t-on-linux.patch"
packages/core2-32-poky-linux/lttng-tools: PV changed from "2.13.10" to "2.13.11"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dbg: PKGSIZE changed from 47877404 to 47931072 (+0%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dbg: PKGV changed from 2.13.10 [default] to 2.13.11 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dbg: PV changed from "2.13.10" to "2.13.11"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dev: PKGV changed from 2.13.10 [default] to 2.13.11 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-dev: PV changed from "2.13.10" to "2.13.11"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-doc: PKGSIZE changed from 300269 to 301014 (+0%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-doc: PKGV changed from 2.13.10 [default] to 2.13.11 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-doc: PV changed from "2.13.10" to "2.13.11"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-locale: PKGV changed from 2.13.10 [default] to 2.13.11 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-locale: PV changed from "2.13.10" to "2.13.11"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: PKGSIZE changed from 16587398 to 16615338 (+0%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: PKGV changed from 2.13.10 [default] to 2.13.11 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: FILELIST: added "/usr/lib/lttng-tools/ptest/tests/regression/tools/client/Makefile /usr/lib/lttng-tools/ptest/tests/regression/tools/client/test_bug1373_events_differ_only_by_loglevel"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: PV changed from "2.13.10" to "2.13.11"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-src: PKGSIZE changed from 6105969 to 6109798 (+0%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools-src: PKGV changed from 2.13.10 [default] to 2.13.11 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-src: PV changed from "2.13.10" to "2.13.11"
packages/core2-32-poky-linux/lttng-tools/lttng-tools-staticdev: PKGV changed from 2.13.10 [default] to 2.13.11 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools-staticdev: PV changed from "2.13.10" to "2.13.11"
packages/core2-32-poky-linux/lttng-tools/lttng-tools: PKGSIZE changed from 5688765 to 5692861 (+0%)
packages/core2-32-poky-linux/lttng-tools/lttng-tools: PKGV changed from 2.13.10 [default] to 2.13.11 [default]
packages/core2-32-poky-linux/lttng-tools/lttng-tools: PV changed from "2.13.10" to "2.13.11"

--===============1922798392480523383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/lttng-tools/lttng-tools-ptest: FILELIST: added "/usr/lib/lttng-tools/ptest/tests/regression/tools/client/Makefile /usr/lib/lttng-tools/ptest/tests/regression/tools/client/test_bug1373_events_differ_only_by_loglevel"

--===============1922798392480523383==--

