Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A427C64981
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 20:32:35 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.145442.1671136352566493793
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 12:32:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GXR2z3gF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010185177d168a-1d4ebecd-3659-4704-a10a-06d92a715851-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=79JOWLh+m70p3WVKeCqxCYozAMp/2yUHOip+NkopjUI=;
	b=GXR2z3gFi4cZapFBnbBI047FFwjks2P3AoWe/enPp7rHJT6j5O9EMnLG3MGFIieD
	j86ERPps40bmQxW0s5O2+d5UY05DmkkST6cFz6RnVNHTXJ5o08KVjKnSD+1vjoRQjl9
	ToUFHOzPkpa0yqu5V9W4lN43y95P5bcnCVG6Q18k=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1671136352;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=79JOWLh+m70p3WVKeCqxCYozAMp/2yUHOip+NkopjUI=;
	b=IFkEJdUNPH8RrZo1C6TeXdNfq92oKMvikQ7yeqgAlHZnCYO1AXq8T4kIpzVs+h97
	AJ1X1ZLs/SIpvqc4sx/kzPbZx5ocfEF91Fep+NTJUutpuratrnAAO5Ck1Q7cVQzU6B7
	jw66vrMpKPfPJJXc/U8SQIOdxIL8cOYUMe48PaUQ=
Content-Type: multipart/mixed; boundary="===============7697515010600759681=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] strace: upgrading to 6.1 SUCCEEDED
Message-ID: <01010185177d168a-1d4ebecd-3659-4704-a10a-06d92a715851-000000@us-west-2.amazonses.com>
Date: Thu, 15 Dec 2022 20:32:31 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.12.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 20:32:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174671

--===============7697515010600759681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *strace* to *6.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-strace-upgrade-6.0-6.1.patch
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
--===============7697515010600759681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1672 targets, 71 skipped, 0 masked, 0 errors.
Removing 1 recipes from the ppc7400 sysroot...done.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f6a1ef0a7880097675304ae916492a723736a35c"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 28 Local 5 Mirrors 0 Missed 23 Current 476 (17% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1450 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_fetch)
NOTE: Running task 1505 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_fetch)
NOTE: Running task 1506 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_fetch)
NOTE: Running task 1544 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 1629 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_populate_sysroot)
NOTE: Running task 1755 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package_write_rpm)
NOTE: recipe strace-6.1-r0: task do_fetch: Started
NOTE: recipe gawk-5.2.1-r0: task do_fetch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Started
NOTE: recipe bluez5-5.65-r0: task do_fetch: Started
NOTE: recipe perl-5.36.0-r0: task do_populate_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_fetch: Succeeded
NOTE: recipe strace-6.1-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.65-r0: task do_fetch: Succeeded
NOTE: Running task 1757 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_unpack)
NOTE: Running task 1758 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1759 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_unpack)
NOTE: Running task 1760 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_unpack)
NOTE: Running task 1761 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1762 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: Running task 1763 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_package_write_rpm)
NOTE: recipe bluez5-5.65-r0: task do_unpack: Started
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe strace-6.1-r0: task do_unpack: Started
NOTE: recipe bluez5-5.65-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.2.1-r0: task do_unpack: Started
NOTE: recipe gawk-5.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Started
NOTE: recipe grep-3.8-r0: task do_package_write_rpm: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Succeeded
NOTE: Running task 1764 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Started
NOTE: recipe gawk-5.2.1-r0: task do_unpack: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Succeeded
NOTE: Running task 1765 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_patch)
NOTE: Running task 1766 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.65-r0: task do_unpack: Succeeded
NOTE: Running task 1767 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_patch)
NOTE: recipe gawk-5.2.1-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.65-r0: task do_patch: Started
NOTE: recipe gawk-5.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1768 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1769 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_patch)
NOTE: recipe perl-5.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1770 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-6.1-r0: task do_patch: Started
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1771 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.2.1-r0: task do_configure: Started
NOTE: recipe bluez5-5.65-r0: task do_patch: Succeeded
NOTE: Running task 1772 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.65-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.65-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe strace-6.1-r0: task do_patch: Succeeded
NOTE: Running task 1773 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: Running task 1774 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1775 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_populate_lic)
NOTE: recipe bluez5-5.65-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1776 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_configure)
NOTE: recipe strace-6.1-r0: task do_populate_lic: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Started
NOTE: recipe strace-6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-6.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_populate_lic unihash changed to cb92c8955a8e40eb7817e561dc9913c724d96ed2f5aac05c5150dc069a572d4e
NOTE: recipe bluez5-5.65-r0: task do_configure: Started
NOTE: recipe strace-6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Succeeded
NOTE: Running task 1777 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Succeeded
NOTE: Running task 1778 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Started
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Succeeded
NOTE: Running task 1779 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Succeeded
NOTE: Running task 1780 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Started
NOTE: recipe grep-3.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Succeeded
NOTE: Running task 1781 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Succeeded
NOTE: Running task 1782 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Succeeded
NOTE: Running task 1783 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Succeeded
NOTE: Running task 1784 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.65-r0: task do_configure: Succeeded
NOTE: Running task 1785 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.65-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.65-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1786 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_compile)
NOTE: recipe bluez5-5.65-r0: task do_compile: Started
NOTE: recipe bluez5-5.65-r0: task do_compile: Succeeded
NOTE: Running task 1787 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.65-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1788 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_configure_ptest_base)
NOTE: recipe gawk-5.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1789 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_compile)
NOTE: recipe gawk-5.2.1-r0: task do_compile: Started
NOTE: recipe gawk-5.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1790 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_compile_ptest_base)
NOTE: recipe gawk-5.2.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1791 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_install)
NOTE: recipe gawk-5.2.1-r0: task do_install: Started
NOTE: recipe gawk-5.2.1-r0: task do_install: Succeeded
NOTE: Running task 1792 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_install_ptest_base)
NOTE: recipe gawk-5.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1793 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package)
NOTE: recipe gawk-5.2.1-r0: task do_package: Started
NOTE: recipe bluez5-5.65-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1794 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_install)
NOTE: recipe bluez5-5.65-r0: task do_install: Started
NOTE: recipe bluez5-5.65-r0: task do_install: Succeeded
NOTE: Running task 1795 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.65-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.65-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1796 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_populate_sysroot)
NOTE: Running task 1797 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_package)
NOTE: recipe bluez5-5.65-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.65-r0: task do_package: Started
NOTE: recipe bluez5-5.65-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1798 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gawk-5.2.1-r0: task do_package: Succeeded
NOTE: Running task 1799 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: recipe strace-6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1800 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package_write_rpm)
NOTE: Running task 1801 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm)
NOTE: Running task 1802 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm)
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm: Started
NOTE: recipe strace-6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1803 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_configure)
NOTE: recipe strace-6.1-r0: task do_configure: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.65-r0: task do_package: Succeeded
NOTE: Running task 1804 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_packagedata)
NOTE: recipe bluez5-5.65-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.65-r0: task do_packagedata: Failed
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe strace-6.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1804 tasks of which 1750 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-src went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-dbg went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-testtools went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-obex went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-noinst-tools went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-ptest went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-staticdev went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-dev went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-doc went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-locale went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5 went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/bluez5/5.65-r0/temp/log.do_packagedata.2275154
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_packagedata) failed with exit code '1'

--===============7697515010600759681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1672 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (887 cached, 1 parsed). 1672 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f6a1ef0a7880097675304ae916492a723736a35c"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 28 Local 5 Mirrors 0 Missed 23 Current 476 (17% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1450 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_fetch)
NOTE: Running task 1505 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_fetch)
NOTE: Running task 1506 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_fetch)
NOTE: Running task 1544 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 1629 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_populate_sysroot)
NOTE: Running task 1754 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_package_write_rpm)
NOTE: recipe strace-6.1-r0: task do_fetch: Started
NOTE: recipe gawk-5.2.1-r0: task do_fetch: Started
NOTE: recipe bluez5-5.65-r0: task do_fetch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Started
NOTE: Running task 1755 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package_write_rpm)
NOTE: recipe gawk-5.2.1-r0: task do_fetch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Succeeded
NOTE: recipe bluez5-5.65-r0: task do_fetch: Succeeded
NOTE: recipe strace-6.1-r0: task do_fetch: Succeeded
NOTE: recipe perl-5.36.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1756 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_unpack)
NOTE: Running task 1757 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1758 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_unpack)
NOTE: Running task 1759 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_unpack)
NOTE: Running task 1760 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1761 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: recipe grep-3.8-r0: task do_package_write_rpm: Started
NOTE: recipe bluez5-5.65-r0: task do_unpack: Started
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe strace-6.1-r0: task do_unpack: Started
NOTE: recipe bluez5-5.65-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.2.1-r0: task do_unpack: Started
NOTE: recipe gawk-5.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Succeeded
NOTE: Running task 1764 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1765 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: Running task 1766 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_patch)
NOTE: recipe bluez5-5.65-r0: task do_unpack: Succeeded
NOTE: Running task 1767 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_patch)
NOTE: recipe gawk-5.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.2.1-r0: task do_patch: Started
NOTE: recipe bluez5-5.65-r0: task do_patch: Started
NOTE: recipe gawk-5.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1768 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1769 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1770 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-6.1-r0: task do_patch: Started
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1771 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_configure)
NOTE: recipe bluez5-5.65-r0: task do_patch: Succeeded
NOTE: Running task 1772 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.65-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_configure: Started
NOTE: recipe bluez5-5.65-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1773 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: recipe strace-6.1-r0: task do_patch: Succeeded
NOTE: Running task 1774 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1775 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_populate_lic)
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Started
NOTE: recipe bluez5-5.65-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1776 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_configure)
NOTE: recipe strace-6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-6.1-r0: task do_populate_lic: Started
NOTE: recipe bluez5-5.65-r0: task do_configure: Started
NOTE: recipe strace-6.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_populate_lic unihash changed to cb92c8955a8e40eb7817e561dc9913c724d96ed2f5aac05c5150dc069a572d4e
NOTE: recipe strace-6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Succeeded
NOTE: Running task 1777 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Succeeded
NOTE: Running task 1778 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Succeeded
NOTE: Running task 1779 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Succeeded
NOTE: Running task 1780 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Succeeded
NOTE: recipe grep-3.8-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 1781 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Succeeded
NOTE: Running task 1782 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Succeeded
NOTE: Running task 1783 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Succeeded
NOTE: Running task 1784 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.65-r0: task do_configure: Succeeded
NOTE: Running task 1785 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.65-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.65-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1786 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_compile)
NOTE: recipe bluez5-5.65-r0: task do_compile: Started
NOTE: recipe bluez5-5.65-r0: task do_compile: Succeeded
NOTE: Running task 1787 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.65-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1788 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_configure_ptest_base)
NOTE: recipe gawk-5.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1789 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_compile)
NOTE: recipe gawk-5.2.1-r0: task do_compile: Started
NOTE: recipe gawk-5.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1790 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_compile_ptest_base)
NOTE: recipe gawk-5.2.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1791 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_install)
NOTE: recipe gawk-5.2.1-r0: task do_install: Started
NOTE: recipe gawk-5.2.1-r0: task do_install: Succeeded
NOTE: Running task 1792 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_install_ptest_base)
NOTE: recipe gawk-5.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.65-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1793 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_install)
NOTE: recipe bluez5-5.65-r0: task do_install: Started
NOTE: recipe bluez5-5.65-r0: task do_install: Succeeded
NOTE: Running task 1794 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_install_ptest_base)
NOTE: recipe gawk-5.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1795 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package)
NOTE: recipe bluez5-5.65-r0: task do_install_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_package: Started
NOTE: recipe bluez5-5.65-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1796 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_populate_sysroot)
NOTE: Running task 1797 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_package)
NOTE: recipe bluez5-5.65-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.65-r0: task do_package: Started
NOTE: recipe bluez5-5.65-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1798 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1799 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_configure)
NOTE: recipe strace-6.1-r0: task do_configure: Started
NOTE: recipe gawk-5.2.1-r0: task do_package: Succeeded
NOTE: Running task 1800 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1801 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm)
NOTE: Running task 1802 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm)
NOTE: Running task 1803 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package_write_rpm)
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm: Started
NOTE: recipe bluez5-5.65-r0: task do_package: Succeeded
NOTE: Running task 1804 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_packagedata)
NOTE: recipe bluez5-5.65-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.65-r0: task do_packagedata: Failed
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe strace-6.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1804 tasks of which 1750 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-src went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-dbg went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-testtools went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-obex went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-noinst-tools went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-ptest went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-staticdev went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-dev went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-doc went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-locale went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5 went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/bluez5/5.65-r0/temp/log.do_packagedata.2122609
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_packagedata) failed with exit code '1'

--===============7697515010600759681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1672 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the mips32r2 sysroot...done.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f6a1ef0a7880097675304ae916492a723736a35c"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 28 Local 5 Mirrors 0 Missed 23 Current 472 (17% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1438 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_fetch)
NOTE: Running task 1493 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_fetch)
NOTE: Running task 1494 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_fetch)
NOTE: Running task 1532 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 1617 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_populate_sysroot)
NOTE: Running task 1742 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package_write_rpm)
NOTE: recipe strace-6.1-r0: task do_fetch: Started
NOTE: recipe gawk-5.2.1-r0: task do_fetch: Started
NOTE: recipe bluez5-5.65-r0: task do_fetch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Started
NOTE: recipe perl-5.36.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1743 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_package_write_rpm)
NOTE: recipe gawk-5.2.1-r0: task do_fetch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Succeeded
NOTE: recipe bluez5-5.65-r0: task do_fetch: Succeeded
NOTE: recipe strace-6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1744 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_unpack)
NOTE: Running task 1745 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1746 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_unpack)
NOTE: Running task 1747 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_unpack)
NOTE: Running task 1748 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1749 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe bluez5-5.65-r0: task do_unpack: Started
NOTE: recipe grep-3.8-r0: task do_package_write_rpm: Started
NOTE: recipe strace-6.1-r0: task do_unpack: Started
NOTE: recipe bluez5-5.65-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.2.1-r0: task do_unpack: Started
NOTE: recipe gawk-5.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Succeeded
NOTE: Running task 1750 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Started
NOTE: recipe gawk-5.2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1751 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Succeeded
NOTE: recipe bluez5-5.65-r0: task do_unpack: Succeeded
NOTE: Running task 1752 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_patch)
NOTE: Running task 1753 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.65-r0: task do_patch: Started
NOTE: recipe gawk-5.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1754 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1755 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_patch)
NOTE: recipe perl-5.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1756 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-6.1-r0: task do_patch: Started
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1757 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.65-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.65-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1758 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.2.1-r0: task do_configure: Started
NOTE: recipe bluez5-5.65-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-6.1-r0: task do_patch: Succeeded
NOTE: Running task 1759 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1760 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_populate_lic)
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1761 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: recipe bluez5-5.65-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1762 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_configure)
NOTE: recipe strace-6.1-r0: task do_populate_lic: Started
NOTE: recipe strace-6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Started
NOTE: recipe strace-6.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_populate_lic unihash changed to cb92c8955a8e40eb7817e561dc9913c724d96ed2f5aac05c5150dc069a572d4e
NOTE: recipe bluez5-5.65-r0: task do_configure: Started
NOTE: recipe strace-6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Succeeded
NOTE: Running task 1763 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Succeeded
NOTE: Running task 1764 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Started
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Succeeded
NOTE: Running task 1765 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Succeeded
NOTE: Running task 1766 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Started
NOTE: recipe grep-3.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Succeeded
NOTE: Running task 1767 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Succeeded
NOTE: Running task 1768 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Succeeded
NOTE: Running task 1769 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Succeeded
NOTE: Running task 1770 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.65-r0: task do_configure: Succeeded
NOTE: Running task 1771 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.65-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.65-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1772 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_compile)
NOTE: recipe bluez5-5.65-r0: task do_compile: Started
NOTE: recipe bluez5-5.65-r0: task do_compile: Succeeded
NOTE: Running task 1773 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.65-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1774 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_configure_ptest_base)
NOTE: recipe gawk-5.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1775 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_compile)
NOTE: recipe gawk-5.2.1-r0: task do_compile: Started
NOTE: recipe gawk-5.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1776 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_compile_ptest_base)
NOTE: recipe gawk-5.2.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1777 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_install)
NOTE: recipe gawk-5.2.1-r0: task do_install: Started
NOTE: recipe gawk-5.2.1-r0: task do_install: Succeeded
NOTE: Running task 1778 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_install_ptest_base)
NOTE: recipe gawk-5.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.65-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1779 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_install)
NOTE: recipe bluez5-5.65-r0: task do_install: Started
NOTE: recipe gawk-5.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1780 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package)
NOTE: recipe gawk-5.2.1-r0: task do_package: Started
NOTE: recipe bluez5-5.65-r0: task do_install: Succeeded
NOTE: Running task 1781 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.65-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.65-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1782 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_populate_sysroot)
NOTE: Running task 1783 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_package)
NOTE: recipe bluez5-5.65-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.65-r0: task do_package: Started
NOTE: recipe bluez5-5.65-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1784 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1785 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_configure)
NOTE: recipe strace-6.1-r0: task do_configure: Started
NOTE: recipe gawk-5.2.1-r0: task do_package: Succeeded
NOTE: Running task 1786 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1787 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package_write_rpm)
NOTE: Running task 1788 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm)
NOTE: Running task 1789 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm)
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm: Started
NOTE: recipe bluez5-5.65-r0: task do_package: Succeeded
NOTE: Running task 1790 of 1801 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_packagedata)
NOTE: recipe bluez5-5.65-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.65-r0: task do_packagedata: Failed
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe strace-6.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1790 tasks of which 1736 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-src went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-dbg went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-testtools went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-obex went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-noinst-tools went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-ptest went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-staticdev went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-dev went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-doc went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-locale went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5 went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/bluez5/5.65-r0/temp/log.do_packagedata.2219540
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_packagedata) failed with exit code '1'

--===============7697515010600759681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/strace: PKGV changed from 6.0 [default] to 6.1 [default]
packages/core2-32-poky-linux/strace: PV changed from "6.0" to "6.1"
packages/core2-32-poky-linux/strace: SRC_URI changed from "https://strace.io/files/6.0/strace-6.0.tar.xz file://update-gawk-paths.patch file://Makefile-ptest.patch file://run-ptest file://0001-caps-abbrev.awk-fix-gawk-s-path.patch file://ptest-spacesave.patch file://0001-strace-fix-reproducibilty-issues.patch file://skip-load.patch" to "https://strace.io/files/6.1/strace-6.1.tar.xz file://update-gawk-paths.patch file://Makefile-ptest.patch file://run-ptest file://0001-caps-abbrev.awk-fix-gawk-s-path.patch file://ptest-spacesave.patch file://0001-strace-fix-reproducibilty-issues.patch file://skip-load.patch"
packages/core2-32-poky-linux/strace/strace-dbg: PKGV changed from 6.0 [default] to 6.1 [default]
packages/core2-32-poky-linux/strace/strace-dbg: PV changed from "6.0" to "6.1"
packages/core2-32-poky-linux/strace/strace-dbg: PKGSIZE changed from 49435200 to 49692548 (+1%)
packages/core2-32-poky-linux/strace/strace-dbg: FILELIST: added "/usr/lib/strace/ptest/tests/.debug/ioctl_winsize /usr/lib/strace/ptest/tests/.debug/ioctl_termios-v /usr/lib/strace/ptest/tests/.debug/ioctl_tiocm /usr/lib/strace/ptest/tests/.debug/ioctl_termios /usr/lib/strace/ptest/tests/.debug/sysctl"
packages/core2-32-poky-linux/strace/strace-dev: PKGV changed from 6.0 [default] to 6.1 [default]
packages/core2-32-poky-linux/strace/strace-dev: PV changed from "6.0" to "6.1"
packages/core2-32-poky-linux/strace/strace-doc: PKGV changed from 6.0 [default] to 6.1 [default]
packages/core2-32-poky-linux/strace/strace-doc: PV changed from "6.0" to "6.1"
packages/core2-32-poky-linux/strace/strace-locale: PKGV changed from 6.0 [default] to 6.1 [default]
packages/core2-32-poky-linux/strace/strace-locale: PV changed from "6.0" to "6.1"
packages/core2-32-poky-linux/strace/strace-ptest: PKGV changed from 6.0 [default] to 6.1 [default]
packages/core2-32-poky-linux/strace/strace-ptest: PV changed from "6.0" to "6.1"
packages/core2-32-poky-linux/strace/strace-ptest: PKGSIZE changed from 28157468 to 28229905 (+0%)
packages/core2-32-poky-linux/strace/strace-ptest: FILELIST: added "/usr/lib/strace/ptest/tests/ioctl_termios.gen.test /usr/lib/strace/ptest/tests/sysctl.gen.test /usr/lib/strace/ptest/tests/ioctl_termios-v /usr/lib/strace/ptest/tests/ioctl_winsize /usr/lib/strace/ptest/tests/ioctl_termios-v.gen.test /usr/lib/strace/ptest/tests/ioctl_tiocm.gen.test /usr/lib/strace/ptest/tests/ioctl_tiocm /usr/lib/strace/ptest/tests/ioctl_winsize.gen.test /usr/lib/strace/ptest/tests/ioctl_termios /usr/lib/strace/ptest/tests/sysctl"
packages/core2-32-poky-linux/strace/strace-src: PKGV changed from 6.0 [default] to 6.1 [default]
packages/core2-32-poky-linux/strace/strace-src: PV changed from "6.0" to "6.1"
packages/core2-32-poky-linux/strace/strace-src: PKGSIZE changed from 10078348 to 9941264 (-1%)
packages/core2-32-poky-linux/strace/strace-src: FILELIST: directory renamed /usr/src/debug/strace/6.0-r0/bundled/linux/include/uapi/mtd -> /usr/src/debug/strace/6.1-r0/bundled/linux/include/uapi/mtd, directory renamed /usr/src/debug/strace/6.0-r0/bundled/linux/include/uapi/linux/netfilter -> /usr/src/debug/strace/6.1-r0/bundled/linux/include/uapi/linux/netfilter, directory renamed /usr/src/debug/strace/6.0-r0/src/linux/x86_64 -> /usr/src/debug/strace/6.1-r0/src/linux/x86_64, directory renamed /usr/src/debug/strace/6.0-r0/bundled/linux/include/uapi/rdma -> /usr/src/debug/strace/6.1-r0/bundled/linux/include/uapi/rdma, directory renamed /usr/src/debug/strace/6.0-r0/src/linux/generic -> /usr/src/debug/strace/6.1-r0/src/linux/generic, directory renamed /usr/src/debug/strace/6.0-r0/src/linux/i386 -> /usr/src/debug/strace/6.1-r0/src/linux/i386, directory renamed /usr/src/debug/strace/6.0-r0/src -> /usr/src/debug/strace/6.1-r0/src, directory renamed /usr/src/debug/strace/6.0-r0/bundled/linux
 /include/uapi/linux -> /usr/src/debug/strace/6.1-r0/bundled/linux/include/uapi/linux, directory renamed /usr/src/debug/strace/6.0-r0/bundled/linux/include/uapi/asm -> /usr/src/debug/strace/6.1-r0/bundled/linux/include/uapi/asm, directory renamed /usr/src/debug/strace/6.0-r0/src/gen -> /usr/src/debug/strace/6.1-r0/src/gen, directory renamed /usr/src/debug/strace/6.0-r0/bundled/linux/include/uapi/linux/netfilter/ipset -> /usr/src/debug/strace/6.1-r0/bundled/linux/include/uapi/linux/netfilter/ipset, removed "/usr/src/debug/strace/6.0-r0/tests/pipe_maxfd.c /usr/src/debug/strace/6.0-r0/tests/status-unfinished.c /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_fields.h /usr/src/debug/strace/6.0-r0/tests/get_page_size.c /usr/src/debug/strace/6.0-r0/tests/inject-nf.c /usr/src/debug/strace/6.0-r0/tests/prctl-unalign.c /usr/src/debug/strace/6.0-r0/tests/rt_sigqueueinfo.c /usr/src/debug/strace/6.0-r0/tests/strace--decode-pids-comm.c /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_qgroup_limit_flags.h /u
 sr/src/debug/strace/6.0-r0/tests/pwritev.c /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_bridge_flags.h /usr/src/debug/strace/6.0-r0/tests/ioctl_kd.c /usr/src/debug/strace/6.0-r0/tests/semtimedop-ipc.c /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_tca_act_hw_stats.h /usr/src/debug/strace/6.0-r0/tests/clock_t_str.c /usr/src/debug/strace/6.0-r0/tests/sethostname.c /usr/src/debug/strace/6.0-r0/src/xlat/keyctl_move_flags.h /usr/src/debug/strace/6.0-r0/tests/ioctl_kvm_run_auxstr_vcpu.c /usr/src/debug/strace/6.0-r0/src/xlat/ebpf_mode.h /usr/src/debug/strace/6.0-r0/src/xlat/ebpf_regs.h /usr/src/debug/strace/6.0-r0/src/xlat/ebpf_size.h /usr/src/debug/strace/6.0-r0/src/xlat/seccomp_filter_flags.h /usr/src/debug/strace/6.0-r0/tests/prctl-tagged-addr.c /usr/src/debug/strace/6.0-r0/src/xlat/personality_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/personality_types.h /usr/src/debug/strace/6.0-r0/tests/ioctl_sg_io_v4.c /usr/src/debug/strace/6.0-r0/src/xlat/bpf_attach_type.h /usr/src/debug/strace/
 6.0-r0/src/xlat/packet_mreq_type.h /usr/src/debug/strace/6.0-r0/tests/nfnetlink_nftables.c /usr/src/debug/strace/6.0-r0/src/xlat/mbind_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/snmp_icmp6_stats.h /usr/src/debug/strace/6.0-r0/tests/unlinkat.c /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_xdp_attached_mode.h /usr/src/debug/strace/6.0-r0/src/xlat/numa_node.h /usr/src/debug/strace/6.0-r0/src/xlat/tun_device_types.h /usr/src/debug/strace/6.0-r0/src/xlat/netlink_states.h /usr/src/debug/strace/6.0-r0/tests/sockopt-timestamp.c /usr/src/debug/strace/6.0-r0/tests/bpf-obj_get_info_by_fd.c /usr/src/debug/strace/6.0-r0/src/xlat/key_reqkeys.h /usr/src/debug/strace/6.0-r0/src/xlat/ifstats_xstats_type_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/dcb_commands.h /usr/src/debug/strace/6.0-r0/src/xlat/pr_pac_enabled_keys.h /usr/src/debug/strace/6.0-r0/src/xlat/at_statx_sync_types.h /usr/src/debug/strace/6.0-r0/tests/sched_xetattr.c /usr/src/debug/strace/6.0-r0/tests/timer_xettime.c /usr/src/debu
 g/strace/6.0-r0/src/xlat/seccomp_ops.h /usr/src/debug/strace/6.0-r0/src/xlat/mpol_mode_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/lockfcmds.h /usr/src/debug/strace/6.0-r0/src/xlat/socktypes.h /usr/src/debug/strace/6.0-r0/tests/osf_utimes.c /usr/src/debug/strace/6.0-r0/src/xlat/ptrace_cmds.h /usr/src/debug/strace/6.0-r0/tests/siginfo.c /usr/src/debug/strace/6.0-r0/tests/sysinfo.c /usr/src/debug/strace/6.0-r0/tests/poke.c /usr/src/debug/strace/6.0-r0/tests/acct.c /usr/src/debug/strace/6.0-r0/src/xlat/quota_formats.h /usr/src/debug/strace/6.0-r0/tests/caps.c /usr/src/debug/strace/6.0-r0/tests/dup2.c /usr/src/debug/strace/6.0-r0/tests/dup3.c /usr/src/debug/strace/6.0-r0/tests/iopl.c /usr/src/debug/strace/6.0-r0/tests/kcmp.c /usr/src/debug/strace/6.0-r0/tests/mq.c /usr/src/debug/strace/6.0-r0/tests/poll.c /usr/src/debug/strace/6.0-r0/src/xlat/tee_ioctl_gen_caps.h /usr/src/debug/strace/6.0-r0/tests/fanotify_init.c /usr/src/debug/strace/6.0-r0/tests/fanotify_mark.c /usr/src/debug/strace
 /6.0-r0/tests/ifindex.c /usr/src/debug/strace/6.0-r0/tests/mlock2.c /usr/src/debug/strace/6.0-r0/tests/inet-cmsg.c /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_tuner_audmodes.h /usr/src/debug/strace/6.0-r0/src/xlat/kexec_load_flags.h /usr/src/debug/strace/6.0-r0/tests/umovestr-illptr.c /usr/src/debug/strace/6.0-r0/src/xlat/fan_classes.h /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_vbi_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_buf_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_buf_types.h /usr/src/debug/strace/6.0-r0/tests/zeroargc.c /usr/src/debug/strace/6.0-r0/tests/nlattr_rtgenmsg.c /usr/src/debug/strace/6.0-r0/tests/execve--secontext.c /usr/src/debug/strace/6.0-r0/tests/inotify.c /usr/src/debug/strace/6.0-r0/tests/ioctl_seccomp.c /usr/src/debug/strace/6.0-r0/tests/mount_setattr.c /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_balance_args.h /usr/src/debug/strace/6.0-r0/tests/nlattr_netlink_diag_msg.c /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_vf_vlan_list_attrs.h /usr/
 src/debug/strace/6.0-r0/src/xlat/close_range_flags.h /usr/src/debug/strace/6.0-r0/tests/move_mount.c /usr/src/debug/strace/6.0-r0/tests/getdents.c /usr/src/debug/strace/6.0-r0/tests/tampering-notes.c /usr/src/debug/strace/6.0-r0/src/xlat/kexec_file_load_flags.h /usr/src/debug/strace/6.0-r0/tests/adjtimex.c /usr/src/debug/strace/6.0-r0/tests/fcntl-common.c /usr/src/debug/strace/6.0-r0/tests/semop-common.c /usr/src/debug/strace/6.0-r0/tests/epoll_pwait.c /usr/src/debug/strace/6.0-r0/src/xlat/nl_xfrm_types.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_ext_filter_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/routing_table_ids.h /usr/src/debug/strace/6.0-r0/tests/migrate_pages.c /usr/src/debug/strace/6.0-r0/tests/ioctl_sock.c /usr/src/debug/strace/6.0-r0/src/xlat/kd_meta_vals.h /usr/src/debug/strace/6.0-r0/src/xlat/mlockall_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/futexwakecmps.h /usr/src/debug/strace/6.0-r0/tests/fchmodat.c /usr/src/debug/strace/6.0-r0/tests/file_handle.c /usr/
 src/debug/strace/6.0-r0/tests/fadvise.h /usr/src/debug/strace/6.0-r0/src/xlat/pr_set_mm.h /usr/src/debug/strace/6.0-r0/tests/madvise.c /usr/src/debug/strace/6.0-r0/src/xlat/syslog_console_levels.h /usr/src/debug/strace/6.0-r0/tests/recvmsg.c /usr/src/debug/strace/6.0-r0/tests/ipc_msg.c /usr/src/debug/strace/6.0-r0/src/xlat/sysctl_net_core.h /usr/src/debug/strace/6.0-r0/tests/ipc_shm.c /usr/src/debug/strace/6.0-r0/src/xlat/inotify_init_flags.h /usr/src/debug/strace/6.0-r0/tests/libmmsg.c /usr/src/debug/strace/6.0-r0/tests/prctl-seccomp-strict.c /usr/src/debug/strace/6.0-r0/src/xlat/bpf_task_fd_type.h /usr/src/debug/strace/6.0-r0/src/xlat/fs_ioc_flags.h /usr/src/debug/strace/6.0-r0/tests/sockaddr_xlat.c /usr/src/debug/strace/6.0-r0/src/xlat/mdb_flags.h /usr/src/debug/strace/6.0-r0/tests/get_sigset_size.c /usr/src/debug/strace/6.0-r0/tests/readlink.c /usr/src/debug/strace/6.0-r0/src/xlat/smc_decl_codes.h /usr/src/debug/strace/6.0-r0/src/xlat/fcntlcmds.h /usr/src/debug/strace/6.0-r0/tes
 ts/net-yy-inet.c /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_dcb_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_mdb_attrs.h /usr/src/debug/strace/6.0-r0/tests/fchmod-y--secontext.c /usr/src/debug/strace/6.0-r0/src/xlat/secbits.h /usr/src/debug/strace/6.0-r0/tests/nlattr_dcbmsg.c /usr/src/debug/strace/6.0-r0/tests/nlattr_ndtmsg.c /usr/src/debug/strace/6.0-r0/src/xlat/mptcp_subflow_flags.h /usr/src/debug/strace/6.0-r0/tests/nlattr_tcamsg.c /usr/src/debug/strace/6.0-r0/tests/prctl-pac-enabled-keys.c /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_control_classes.h /usr/src/debug/strace/6.0-r0/src/xlat/getrandom_flags.h /usr/src/debug/strace/6.0-r0/tests/nlattr_fib_rule_hdr.c /usr/src/debug/strace/6.0-r0/src/xlat/rtc_backup_switch_modes.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_tca_stats_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/keyctl_commands.h /usr/src/debug/strace/6.0-r0/src/xlat/kvm_mem_flags.h /usr/src/debug/strace/6.0-r0/tests/umovestr_cached.c /usr/src/debug/strace/6.0-r0/s
 rc/xlat/adjtimex_state.h /usr/src/debug/strace/6.0-r0/src/xlat/seccomp_ioctl_addfd_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_nfcllcp_options.h /usr/src/debug/strace/6.0-r0/tests/symlink.c /usr/src/debug/strace/6.0-r0/src/xlat/qipcrtr_ports.h /usr/src/debug/strace/6.0-r0/src/xlat/epollflags.h /usr/src/debug/strace/6.0-r0/src/xlat/mpol_modes.h /usr/src/debug/strace/6.0-r0/src/xlat/fdb_notify_flags.h /usr/src/debug/strace/6.0-r0/tests/filter-unavailable.c /usr/src/debug/strace/6.0-r0/src/xlat/netlink_protocols.h /usr/src/debug/strace/6.0-r0/tests/pkey_mprotect.c /usr/src/debug/strace/6.0-r0/src/xlat/smc_diag_attrs.h /usr/src/debug/strace/6.0-r0/tests/mlockall.c /usr/src/debug/strace/6.0-r0/tests/quotactl_fd.c /usr/src/debug/strace/6.0-r0/src/xlat/uffd_register_mode_flags.h /usr/src/debug/strace/6.0-r0/tests/libsocketcall.c /usr/src/debug/strace/6.0-r0/src/xlat/sigtrap_codes.h /usr/src/debug/strace/6.0-r0/tests/io_uring_register.c /usr/src/debug/strace/6.0-r0/src/xlat/uffd_copy
 _flags.h /usr/src/debug/strace/6.0-r0/tests/lookup_dcookie.c /usr/src/debug/strace/6.0-r0/src/xlat/nf_queue_msg_types.h /usr/src/debug/strace/6.0-r0/src/xlat/tcxonc_options.h /usr/src/debug/strace/6.0-r0/tests/semtimedop.c /usr/src/debug/strace/6.0-r0/tests/printflags.c /usr/src/debug/strace/6.0-r0/src/xlat/kvm_cap.h /usr/src/debug/strace/6.0-r0/tests/netlink_selinux.c /usr/src/debug/strace/6.0-r0/src/xlat/mctl_sync.h /usr/src/debug/strace/6.0-r0/src/xlat/perf_sw_ids.h /usr/src/debug/strace/6.0-r0/src/xlat/tee_ioctl_origins.h /usr/src/debug/strace/6.0-r0/src/xlat/splice_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/evdev_ff_status.h /usr/src/debug/strace/6.0-r0/src/xlat/evdev_abs.h /usr/src/debug/strace/6.0-r0/src/xlat/evdev_snd.h /usr/src/debug/strace/6.0-r0/src/xlat/modetypes.h /usr/src/debug/strace/6.0-r0/tests/rt_sigsuspend.c /usr/src/debug/strace/6.0-r0/tests/io_uring_enter.c /usr/src/debug/strace/6.0-r0/src/xlat/ifstats_xstats_bridge_attrs.h /usr/src/debug/strace/6.0-r0/tests/
 init_delete_module.h /usr/src/debug/strace/6.0-r0/tests/net-packet_mreq.c /usr/src/debug/strace/6.0-r0/src/xlat/perf_branch_sample_type.h /usr/src/debug/strace/6.0-r0/src/xlat/compat_ptrace_cmds.h /usr/src/debug/strace/6.0-r0/tests/nsyscalls.c /usr/src/debug/strace/6.0-r0/src/xlat/addrfams.h /usr/src/debug/strace/6.0-r0/tests/prctl-arg2-intptr.c /usr/src/debug/strace/6.0-r0/src/xlat/pr_sme_vl_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/pr_sve_vl_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/ifstats_xstats_bond_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_br_boolopts.h /usr/src/debug/strace/6.0-r0/tests/netlink_protocol.c /usr/src/debug/strace/6.0-r0/tests/kernel_old_timex.h /usr/src/debug/strace/6.0-r0/tests/nfnetlink_acct.c /usr/src/debug/strace/6.0-r0/tests/nfnetlink_queue.c /usr/src/debug/strace/6.0-r0/src/xlat/xattrflags.h /usr/src/debug/strace/6.0-r0/src/xlat/inet_diag_extended_flags.h /usr/src/debug/strace/6.0-r0/tests/hexquote_strndup.c /usr/src/debug/strace/6.0-
 r0/src/xlat/ip_type_of_services.h /usr/src/debug/strace/6.0-r0/tests/mount.c /usr/src/debug/strace/6.0-r0/tests/umask.c /usr/src/debug/strace/6.0-r0/tests/uname.c /usr/src/debug/strace/6.0-r0/tests/ustat.c /usr/src/debug/strace/6.0-r0/tests/utime.c /usr/src/debug/strace/6.0-r0/tests/mknod.c /usr/src/debug/strace/6.0-r0/tests/times.c /usr/src/debug/strace/6.0-r0/tests/tkill.c /usr/src/debug/strace/6.0-r0/tests/ppoll.c /usr/src/debug/strace/6.0-r0/tests/alarm.c /usr/src/debug/strace/6.0-r0/tests/pidns.h /usr/src/debug/strace/6.0-r0/tests/mmsg_name.c /usr/src/debug/strace/6.0-r0/tests/tests.h /usr/src/debug/strace/6.0-r0/tests/setpgrp-exec.c /usr/src/debug/strace/6.0-r0/tests/truncate64.c /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_tree_objectids.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_addrlabel_attrs.h /usr/src/debug/strace/6.0-r0/tests/timerfd_xettime.c /usr/src/debug/strace/6.0-r0/src/xlat/routing_types.h /usr/src/debug/strace/6.0-r0/src/xlat/tls_info_ciphers.h /usr/src/debug/s
 trace/6.0-r0/src/xlat/rtnl_mdba_router_attrs.h /usr/src/debug/strace/6.0-r0/tests/prctl-tsc.c /usr/src/debug/strace/6.0-r0/src/xlat/name_to_handle_at_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/hw_breakpoint_type.h /usr/src/debug/strace/6.0-r0/src/xlat/quotacmds.h /usr/src/debug/strace/6.0-r0/tests/nlattr_ifla_brport.c /usr/src/debug/strace/6.0-r0/src/xlat/bpf_map_types.h /usr/src/debug/strace/6.0-r0/src/xlat/seccomp_mode.h /usr/src/debug/strace/6.0-r0/tests/rt_sigprocmask.c /usr/src/debug/strace/6.0-r0/tests/futimesat.c /usr/src/debug/strace/6.0-r0/tests/nlattr_ifla_vfinfo.c /usr/src/debug/strace/6.0-r0/tests/recvfrom-MSG_TRUNC.c /usr/src/debug/strace/6.0-r0/tests/create_nl_socket.c /usr/src/debug/strace/6.0-r0/tests/so_linger.c /usr/src/debug/strace/6.0-r0/tests/pidns-cache.c /usr/src/debug/strace/6.0-r0/src/xlat/rtc_vl_flags.h /usr/src/debug/strace/6.0-r0/tests/nlattr_ifla_protinfo.c /usr/src/debug/strace/6.0-r0/src/xlat/ptrace_setoptions_flags.h /usr/src/debug/strace/6.0-r0/sr
 c/xlat/rtnl_neigh_fdb_ext_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/neighbor_cache_entry_flags.h /usr/src/debug/strace/6.0-r0/tests/poke-sendfile.c /usr/src/debug/strace/6.0-r0/src/xlat/gpio_event_flags.h /usr/src/debug/strace/6.0-r0/tests/nlattr_ifaddrmsg.c /usr/src/debug/strace/6.0-r0/tests/nlattr_ifinfomsg.c /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_memories.h /usr/src/debug/strace/6.0-r0/src/xlat/routing_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/nfc_saps.h /usr/src/debug/strace/6.0-r0/tests/create_tmpfile.c /usr/src/debug/strace/6.0-r0/tests/net-tpacket_req.c /usr/src/debug/strace/6.0-r0/tests/nlattr_smc_diag_msg.c /usr/src/debug/strace/6.0-r0/tests/ioctl_perf-success.c /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_addr_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_link_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_nsid_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_rule_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/sg_io_info.h /usr/src/debug/strace/6.0-r0/t
 ests/trie_test.c /usr/src/debug/strace/6.0-r0/src/xlat/sock_shutdown_flags.h /usr/src/debug/strace/6.0-r0/tests/sendfile64.c /usr/src/debug/strace/6.0-r0/tests/xstatx.c /usr/src/debug/strace/6.0-r0/src/xlat/netlink_delete_flags.h /usr/src/debug/strace/6.0-r0/tests/nfnetlink_osf.c /usr/src/debug/strace/6.0-r0/tests/ioctl_v4l2.c /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_vfinfo_list_attrs.h /usr/src/debug/strace/6.0-r0/tests/utimensat.c /usr/src/debug/strace/6.0-r0/tests/set_mempolicy_home_node.c /usr/src/debug/strace/6.0-r0/tests/arch_prctl.c /usr/src/debug/strace/6.0-r0/src/xlat/bpf_link_create_kprobe_multi_flags.h /usr/src/debug/strace/6.0-r0/tests/semtimedop-syscall.c /usr/src/debug/strace/6.0-r0/src/xlat/bpf_map_update_elem_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/membarrier_cmds.h /usr/src/debug/strace/6.0-r0/tests/sigaction.c /usr/src/debug/strace/6.0-r0/tests/fchownat.c /usr/src/debug/strace/6.0-r0/tests/filter_seccomp-flag.c /usr/src/debug/strace/6.0-r0/src/xlat/clo
 ckflags.h /usr/src/debug/strace/6.0-r0/src/xlat/clocknames.h /usr/src/debug/strace/6.0-r0/src/xlat/vsock_cids.h /usr/src/debug/strace/6.0-r0/tests/umovestr2.c /usr/src/debug/strace/6.0-r0/src/xlat/nf_ctnetlink_msg_types.h /usr/src/debug/strace/6.0-r0/src/xlat/aio_iocb_flags.h /usr/src/debug/strace/6.0-r0/tests/ioctl_sock_gifconf.c /usr/src/debug/strace/6.0-r0/tests/kexec_load.c /usr/src/debug/strace/6.0-r0/src/xlat/loop_crypt_type_options.h /usr/src/debug/strace/6.0-r0/tests/move_pages.c /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_dev_replace_results.h /usr/src/debug/strace/6.0-r0/tests/recvmmsg-timeout.c /usr/src/debug/strace/6.0-r0/src/xlat/kd_key_brl_keys.h /usr/src/debug/strace/6.0-r0/src/xlat/kd_key_cur_keys.h /usr/src/debug/strace/6.0-r0/src/xlat/kd_key_pad_keys.h /usr/src/debug/strace/6.0-r0/src/xlat/shm_flags.h /usr/src/debug/strace/6.0-r0/tests/pidfd_send_signal.c /usr/src/debug/strace/6.0-r0/tests/ioctl_mtd.c /usr/src/debug/strace/6.0-r0/tests/fsopen.c /usr/src/debug/strac
 e/6.0-r0/tests/error_msg.c /usr/src/debug/strace/6.0-r0/src/xlat/uring_files_update_fds.h /usr/src/debug/strace/6.0-r0/src/xlat/sched_flags.h /usr/src/debug/strace/6.0-r0/tests/prctl-mce-kill.c /usr/src/debug/strace/6.0-r0/tests/nlattr_cachereport.c /usr/src/debug/strace/6.0-r0/src/xlat/packet_diag_show.h /usr/src/debug/strace/6.0-r0/tests/net-y-unix.c /usr/src/debug/strace/6.0-r0/src/xlat/futexwakeops.h /usr/src/debug/strace/6.0-r0/src/xlat/bluetooth_l2_cid.h /usr/src/debug/strace/6.0-r0/src/xlat/uring_register_opcodes.h /usr/src/debug/strace/6.0-r0/tests/s390_sthyi.c /usr/src/debug/strace/6.0-r0/tests/signal.c /usr/src/debug/strace/6.0-r0/tests/tgkill.c /usr/src/debug/strace/6.0-r0/tests/keyctl.c /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_streaming_capabilities.h /usr/src/debug/strace/6.0-r0/tests/attach-f-p-cmd.c /usr/src/debug/strace/6.0-r0/src/xlat/kd_key_tables.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_netlink_options.h /usr/src/debug/strace/6.0-r0/src/xlat/smc_diag_mode.h 
 /usr/src/debug/strace/6.0-r0/tests/fcntl.c /usr/src/debug/strace/6.0-r0/tests/flock.c /usr/src/debug/strace/6.0-r0/src/xlat/fsopen_flags.h /usr/src/debug/strace/6.0-r0/tests/ioctl_ptp.c /usr/src/debug/strace/6.0-r0/tests/aio_pgetevents.c /usr/src/debug/strace/6.0-r0/tests/accept.c /usr/src/debug/strace/6.0-r0/tests/chroot.c /usr/src/debug/strace/6.0-r0/tests/linkat.c /usr/src/debug/strace/6.0-r0/tests/openat.c /usr/src/debug/strace/6.0-r0/tests/reboot.c /usr/src/debug/strace/6.0-r0/tests/select.c /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_vf_stats_attrs.h /usr/src/debug/strace/6.0-r0/tests/umount.c /usr/src/debug/strace/6.0-r0/tests/semtimedop-common.c /usr/src/debug/strace/6.0-r0/tests/preadv.c /usr/src/debug/strace/6.0-r0/src/xlat/uffd_register_ioctl_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/access_modes.h /usr/src/debug/strace/6.0-r0/src/xlat/counter_ioctl_scopes.h /usr/src/debug/strace/6.0-r0/tests/finit_module.c /usr/src/debug/strace/6.0-r0/tests/prctl_marker.c /usr/sr
 c/debug/strace/6.0-r0/tests/oldselect-efault.c /usr/src/debug/strace/6.0-r0/src/xlat/inet_devconf_indices.h /usr/src/debug/strace/6.0-r0/src/xlat/mount_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/wait4_options.h /usr/src/debug/strace/6.0-r0/tests/getrusage.c /usr/src/debug/strace/6.0-r0/tests/pidfd_open.c /usr/src/debug/strace/6.0-r0/tests/prctl-sme.c /usr/src/debug/strace/6.0-r0/tests/prctl-sve.c /usr/src/debug/strace/6.0-r0/tests/attach-p-cmd-p.c /usr/src/debug/strace/6.0-r0/tests/attach-p-cmd.h /usr/src/debug/strace/6.0-r0/src/xlat/ifstats_af_spec_mpls_attrs.h /usr/src/debug/strace/6.0-r0/tests/ioctl_v4l2-success.c /usr/src/debug/strace/6.0-r0/src/xlat/kvm_cpuid_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/hdio_drive_cmds.h /usr/src/debug/strace/6.0-r0/tests/ioctl_inotify.c /usr/src/debug/strace/6.0-r0/src/xlat/rename_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/notifyflags.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_af_spec_mctp_attrs.h /usr/src/debug/strace/6.0-r0/tes
 ts/net-yy-unix.c /usr/src/debug/strace/6.0-r0/src/xlat/x86_xfeatures.h /usr/src/debug/strace/6.0-r0/src/xlat/pr_unalign_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_port_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_bridge_modes.h /usr/src/debug/strace/6.0-r0/src/xlat/ifaddrflags.h /usr/src/debug/strace/6.0-r0/tests/sockopt-sol_netlink.c /usr/src/debug/strace/6.0-r0/tests/inotify_init.c /usr/src/debug/strace/6.0-r0/src/xlat/kd_key_ascii_keys.h /usr/src/debug/strace/6.0-r0/src/xlat/move_mount_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/move_pages_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/perf_type_id.h /usr/src/debug/strace/6.0-r0/tests/ioctl_dm.c /usr/src/debug/strace/6.0-r0/src/xlat/sigprocmaskcmds.h /usr/src/debug/strace/6.0-r0/src/xlat/getsock_ip_options.h /usr/src/debug/strace/6.0-r0/src/xlat/setsock_ip_options.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_tca_act_flags.h /usr/src/debug/strace/6.0-r0/tests/faccessat--secontext.c /usr/src/debug/strace/6.
 0-r0/tests/msg_control.c /usr/src/debug/strace/6.0-r0/src/xlat/bpf_mode.h /usr/src/debug/strace/6.0-r0/src/xlat/mmap_prot.h /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_csum_types.h /usr/src/debug/strace/6.0-r0/tests/prlimit64.c /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_colorspaces.h /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_snap_flags_v2.h /usr/src/debug/strace/6.0-r0/src/xlat/lirc_modes.h /usr/src/debug/strace/6.0-r0/tests/ioctl_gpio.c /usr/src/debug/strace/6.0-r0/tests/perf_event_open.c /usr/src/debug/strace/6.0-r0/src/xlat/ifstats_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/mctp_addrs.h /usr/src/debug/strace/6.0-r0/src/xlat/socketcalls.h /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_pix_fmts.h /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_sdr_fmts.h /usr/src/debug/strace/6.0-r0/tests/filter_seccomp-perf.c /usr/src/debug/strace/6.0-r0/tests/print_time.c /usr/src/debug/strace/6.0-r0/src/xlat/nf_cttimeout_msg_types.h /usr/src/debug/strace/6.0-r0/tests/chmod--secontext.c /usr/src/debu
 g/strace/6.0-r0/src/xlat/rtc_params.h /usr/src/debug/strace/6.0-r0/src/xlat/smc_states.h /usr/src/debug/strace/6.0-r0/src/xlat/uffd_api_flags.h /usr/src/debug/strace/6.0-r0/tests/ioctl_nsfs.c /usr/src/debug/strace/6.0-r0/src/xlat/archvals.h /usr/src/debug/strace/6.0-r0/src/xlat/sysctl_net_ipv6_route.h /usr/src/debug/strace/6.0-r0/src/xlat/advise.h /usr/src/debug/strace/6.0-r0/src/xlat/sysctl_net_ipv4_route.h /usr/src/debug/strace/6.0-r0/tests/fchownat--secontext.c /usr/src/debug/strace/6.0-r0/src/xlat/netlink_diag_show.h /usr/src/debug/strace/6.0-r0/tests/sigsuspend.c /usr/src/debug/strace/6.0-r0/tests/printstrn-umoven-peekdata.c /usr/src/debug/strace/6.0-r0/tests/fsync-y.c /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_buf_flags_ts_src.h /usr/src/debug/strace/6.0-r0/tests/mbind.c /usr/src/debug/strace/6.0-r0/src/xlat/clone3_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/uffd_zeropage_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_balance_ctl_cmds.h /usr/src/debug/strace/6.0-r0/src/
 xlat/perf_hw_cache_op_id.h /usr/src/debug/strace/6.0-r0/tests/getegid.c /usr/src/debug/strace/6.0-r0/tests/geteuid.c /usr/src/debug/strace/6.0-r0/tests/getppid.c /usr/src/debug/strace/6.0-r0/tests/getxgid.c /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_control_query_flags.h /usr/src/debug/strace/6.0-r0/tests/getxpid.c /usr/src/debug/strace/6.0-r0/tests/getxuid.c /usr/src/debug/strace/6.0-r0/tests/setugid.c /usr/src/debug/strace/6.0-r0/tests/waitpid.c /usr/src/debug/strace/6.0-r0/tests/xetpgid.c /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_qgroup_inherit_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/evdev_autorepeat.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_netconf_attrs.h /usr/src/debug/strace/6.0-r0/tests/epoll_create.c /usr/src/debug/strace/6.0-r0/tests/memfd_create.c /usr/src/debug/strace/6.0-r0/tests/timer_create.c /usr/src/debug/strace/6.0-r0/tests/ftruncate64.c /usr/src/debug/strace/6.0-r0/tests/ioctl_ubi.c /usr/src/debug/strace/6.0-r0/tests/umoven-illptr.c /usr/src/debug/strac
 e/6.0-r0/src/xlat/ieee802154_addr_types.h /usr/src/debug/strace/6.0-r0/tests/qual_inject-error-signal.c /usr/src/debug/strace/6.0-r0/src/xlat/keyctl_caps1.h /usr/src/debug/strace/6.0-r0/src/xlat/pr_pac_keys.h /usr/src/debug/strace/6.0-r0/tests/test_nlattr.h /usr/src/debug/strace/6.0-r0/src/xlat/ipccalls.h /usr/src/debug/strace/6.0-r0/tests/sched_get_priority_mxx.c /usr/src/debug/strace/6.0-r0/tests/netlink_kobject_uevent.c /usr/src/debug/strace/6.0-r0/src/xlat/nfc_protocols.h /usr/src/debug/strace/6.0-r0/src/xlat/smc_protocols.h /usr/src/debug/strace/6.0-r0/tests/sched_yield.c /usr/src/debug/strace/6.0-r0/tests/readdir.c /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_meta_fmts.h /usr/src/debug/strace/6.0-r0/tests/quotactl.c /usr/src/debug/strace/6.0-r0/tests/quotactl.h /usr/src/debug/strace/6.0-r0/tests/seccomp-filter.c /usr/src/debug/strace/6.0-r0/src/xlat/evdev_ev.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_tca_stab_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_qgroup_ctl_cmds.
 h /usr/src/debug/strace/6.0-r0/tests/fsconfig.c /usr/src/debug/strace/6.0-r0/tests/seccomp-strict.c /usr/src/debug/strace/6.0-r0/tests/nlattr_tca_stab.c /usr/src/debug/strace/6.0-r0/tests/netlink_netlink_diag.c /usr/src/debug/strace/6.0-r0/tests/faccessat-y--secontext.c /usr/src/debug/strace/6.0-r0/tests/access.c /usr/src/debug/strace/6.0-r0/tests/setdomainname.c /usr/src/debug/strace/6.0-r0/tests/status.c /usr/src/debug/strace/6.0-r0/tests/getcpu.c /usr/src/debug/strace/6.0-r0/src/xlat/tls_info_configs.h /usr/src/debug/strace/6.0-r0/src/xlat/delete_module_flags.h /usr/src/debug/strace/6.0-r0/tests/fdatasync.c /usr/src/debug/strace/6.0-r0/src/xlat/nbd_ioctl_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/socketlayers.h /usr/src/debug/strace/6.0-r0/src/xlat/tcflsh_options.h /usr/src/debug/strace/6.0-r0/src/xlat/ifstats_xstats_bridge_mcast_indices.h /usr/src/debug/strace/6.0-r0/tests/prctl-fp-mode.c /usr/src/debug/strace/6.0-r0/tests/stack-fcall-0.c /usr/src/debug/strace/6.0-r0/tests/st
 ack-fcall-1.c /usr/src/debug/strace/6.0-r0/tests/stack-fcall-2.c /usr/src/debug/strace/6.0-r0/tests/stack-fcall-3.c /usr/src/debug/strace/6.0-r0/src/xlat/setns_types.h /usr/src/debug/strace/6.0-r0/src/xlat/madvise_cmds.h /usr/src/debug/strace/6.0-r0/src/xlat/netfilter_versions.h /usr/src/debug/strace/6.0-r0/src/xlat/unix_diag_show.h /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_buf_flags_ts_type.h /usr/src/debug/strace/6.0-r0/tests/open--secontext.c /usr/src/debug/strace/6.0-r0/src/xlat/evdev_mtslots.h /usr/src/debug/strace/6.0-r0/src/xlat/bpf_attach_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/nf_hook_msg_types.h /usr/src/debug/strace/6.0-r0/tests/landlock_restrict_self.c /usr/src/debug/strace/6.0-r0/src/xlat/seccomp_ret_action.h /usr/src/debug/strace/6.0-r0/tests/signal_receive.c /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_family.h /usr/src/debug/strace/6.0-r0/tests/pkey_free.c /usr/src/debug/strace/6.0-r0/src/xlat/key_perms.h /usr/src/debug/strace/6.0-r0/tests/syslog.c /usr/src/debu
 g/strace/6.0-r0/tests/net-tpacket_stats.c /usr/src/debug/strace/6.0-r0/tests/nlattr_packet_diag_msg.c /usr/src/debug/strace/6.0-r0/src/xlat/nl_sock_diag_types.h /usr/src/debug/strace/6.0-r0/src/xlat/semop_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/hdio_busstates.h /usr/src/debug/strace/6.0-r0/src/xlat/uring_sqe_flags.h /usr/src/debug/strace/6.0-r0/tests/fill_memory.c /usr/src/debug/strace/6.0-r0/tests/xetpriority.c /usr/src/debug/strace/6.0-r0/src/xlat/gpio_handle_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/nlmsgerr_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_input_types.h /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_tuner_types.h /usr/src/debug/strace/6.0-r0/src/xlat/waitid_types.h /usr/src/debug/strace/6.0-r0/src/xlat/sysctl_net_unix.h /usr/src/debug/strace/6.0-r0/src/xlat/perf_event_sample_format.h /usr/src/debug/strace/6.0-r0/src/xlat/pr_set_vma.h /usr/src/debug/strace/6.0-r0/src/xlat/routing_protocols.h /usr/src/debug/strace/6.0-r0/tests/preadv-pwritev.c /usr/src/debu
 g/strace/6.0-r0/tests/clone3.c /usr/src/debug/strace/6.0-r0/tests/prctl-seccomp-filter-v.c /usr/src/debug/strace/6.0-r0/src/xlat/inet_diag_shutdown_flags.h /usr/src/debug/strace/6.0-r0/tests/prctl-tid_address.c /usr/src/debug/strace/6.0-r0/tests/nlattr_ndmsg.c /usr/src/debug/strace/6.0-r0/tests/nlattr_nhmsg.c /usr/src/debug/strace/6.0-r0/tests/nlattr_rtmsg.c /usr/src/debug/strace/6.0-r0/tests/nlattr_tcmsg.c /usr/src/debug/strace/6.0-r0/tests/skip_unavailable.c /usr/src/debug/strace/6.0-r0/src/xlat/sockopt_txrehash_vals.h /usr/src/debug/strace/6.0-r0/src/xlat/pr_sched_core_cmds.h /usr/src/debug/strace/6.0-r0/src/xlat/hdio_ide_nice.h /usr/src/debug/strace/6.0-r0/src/xlat/ieee802154_pan_ids.h /usr/src/debug/strace/6.0-r0/src/xlat/inet6_if_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/ptp_perout_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_rta_metrics_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/perf_event_read_format.h /usr/src/debug/strace/6.0-r0/tests/io_uring_setup.c /usr/src
 /debug/strace/6.0-r0/tests/nlattr_mdba_router_port.c /usr/src/debug/strace/6.0-r0/tests/status-successful.c /usr/src/debug/strace/6.0-r0/src/xlat/tee_ioctl_optee_caps.h /usr/src/debug/strace/6.0-r0/tests/nlattr_ifstats.c /usr/src/debug/strace/6.0-r0/src/xlat/nl_audit_types.h /usr/src/debug/strace/6.0-r0/src/xlat/sigchld_codes.h /usr/src/debug/strace/6.0-r0/src/xlat/tcp_states.h /usr/src/debug/strace/6.0-r0/tests/segv_pkuerr.c /usr/src/debug/strace/6.0-r0/tests/nfnetlink_cthelper.c /usr/src/debug/strace/6.0-r0/src/xlat/pr_mce_kill.h /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_control_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_control_types.h /usr/src/debug/strace/6.0-r0/tests/netlink_netfilter.c /usr/src/debug/strace/6.0-r0/tests/sync.c /usr/src/debug/strace/6.0-r0/tests/time.c /usr/src/debug/strace/6.0-r0/tests/swap.c /usr/src/debug/strace/6.0-r0/tests/kill.c /usr/src/debug/strace/6.0-r0/tests/link.c /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_scrub_flags.h /usr/src/debug/str
 ace/6.0-r0/tests/mmap.c /usr/src/debug/strace/6.0-r0/tests/mmsg.c /usr/src/debug/strace/6.0-r0/tests/open.c /usr/src/debug/strace/6.0-r0/tests/pipe.c /usr/src/debug/strace/6.0-r0/tests/nlattr_br_port_msg.c /usr/src/debug/strace/6.0-r0/tests/sxetmask.c /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_brport_attrs.h /usr/src/debug/strace/6.0-r0/tests/block_reset_raise_run.c /usr/src/debug/strace/6.0-r0/src/xlat/fdflags.h /usr/src/debug/strace/6.0-r0/tests/tracer_ppid_pgid_sid.c /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_compress_types.h /usr/src/debug/strace/6.0-r0/src/xlat/neighbor_cache_entry_ext_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/irda_protocols.h /usr/src/debug/strace/6.0-r0/src/xlat/fan_init_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/fan_mark_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/nl_netfilter_subsys_ids.h /usr/src/debug/strace/6.0-r0/tests/scm_rights.c /usr/src/debug/strace/6.0-r0/tests/errno2name.c /usr/src/debug/strace/6.0-r0/tests/sendfile.c /usr/src/debug
 /strace/6.0-r0/tests/aio.c /usr/src/debug/strace/6.0-r0/tests/kill_child.c /usr/src/debug/strace/6.0-r0/tests/nlattr_ifla_af_spec.c /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_logical_ino_args_flags.h /usr/src/debug/strace/6.0-r0/tests/net-yy-netlink.c /usr/src/debug/strace/6.0-r0/tests/preadv2-pwritev2.c /usr/src/debug/strace/6.0-r0/src/xlat/rtc_features.h /usr/src/debug/strace/6.0-r0/src/xlat/phonet_protocols.h /usr/src/debug/strace/6.0-r0/src/xlat/bt_protocols.h /usr/src/debug/strace/6.0-r0/src/xlat/fiemap_extent_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/fs_xflags.h /usr/src/debug/strace/6.0-r0/tests/getsockname.c /usr/src/debug/strace/6.0-r0/tests/prctl-set-ptracer-success.c /usr/src/debug/strace/6.0-r0/tests/status-failed.c /usr/src/debug/strace/6.0-r0/tests/status-none-f.c /usr/src/debug/strace/6.0-r0/src/xlat/bdaddr_types.h /usr/src/debug/strace/6.0-r0/src/xlat/ptrace_events.h /usr/src/debug/strace/6.0-r0/src/xlat/ptrace_peeksiginfo_flags.h /usr/src/debug/strace/6.0-r0/te
 sts/lock_file.c /usr/src/debug/strace/6.0-r0/tests/so_error.c /usr/src/debug/strace/6.0-r0/tests/printstr.c /usr/src/debug/strace/6.0-r0/tests/umovestr.c /usr/src/debug/strace/6.0-r0/src/xlat/gpio_v2_line_attr_ids.h /usr/src/debug/strace/6.0-r0/src/xlat/kd_led_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/f_owner_types.h /usr/src/debug/strace/6.0-r0/tests/ioctl_rtc.c /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_br_mcast_querier_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/f_seals.h /usr/src/debug/strace/6.0-r0/tests/epoll_wait.c /usr/src/debug/strace/6.0-r0/src/xlat/pr_spec_cmds.h /usr/src/debug/strace/6.0-r0/tests/prctl-set_vma.c /usr/src/debug/strace/6.0-r0/tests/xattr-strings.c /usr/src/debug/strace/6.0-r0/tests/inotify_init1.c /usr/src/debug/strace/6.0-r0/src/xlat/pr_dumpable.h /usr/src/debug/strace/6.0-r0/src/xlat/loop_flags_options.h /usr/src/debug/strace/6.0-r0/tests/ioctl_evdev-success.c /usr/src/debug/strace/6.0-r0/tests/prctl-pac-reset-keys.c /usr/src/debug/strace/6.0-
 r0/tests/signalfd4.c /usr/src/debug/strace/6.0-r0/src/xlat/nf_ulog_msg_types.h /usr/src/debug/strace/6.0-r0/tests/copy_file_range.c /usr/src/debug/strace/6.0-r0/tests/sync_file_range.c /usr/src/debug/strace/6.0-r0/src/xlat/kd_modes.h /usr/src/debug/strace/6.0-r0/tests/nlattr_netconfmsg.c /usr/src/debug/strace/6.0-r0/tests/eventfd.c /usr/src/debug/strace/6.0-r0/tests/printpath-umovestr.c /usr/src/debug/strace/6.0-r0/tests/set_sigign.c /usr/src/debug/strace/6.0-r0/tests/sockopt-sol_socket.c /usr/src/debug/strace/6.0-r0/src/xlat/ubi_data_types.h /usr/src/debug/strace/6.0-r0/tests/xutimes.c /usr/src/debug/strace/6.0-r0/src/xlat/epollevents.h /usr/src/debug/strace/6.0-r0/tests/ip_mreq.c /usr/src/debug/strace/6.0-r0/tests/nlattr_ifla_linkinfo.c /usr/src/debug/strace/6.0-r0/tests/setfsugid.c /usr/src/debug/strace/6.0-r0/tests/setreugid.c /usr/src/debug/strace/6.0-r0/tests/getsockname--secontext.c /usr/src/debug/strace/6.0-r0/src/xlat/fan_event_flags.h /usr/src/debug/strace/6.0-r0/tests/ker
 nel_old_timespec.h /usr/src/debug/strace/6.0-r0/tests/test_printstrn.c /usr/src/debug/strace/6.0-r0/src/xlat/sg_scsi_reset.h /usr/src/debug/strace/6.0-r0/src/xlat/kd_key_slock_keys.h /usr/src/debug/strace/6.0-r0/src/xlat/pr_fp_mode.h /usr/src/debug/strace/6.0-r0/src/xlat/pr_sud_cmds.h /usr/src/debug/strace/6.0-r0/tests/test_printpath.c /usr/src/debug/strace/6.0-r0/tests/at_fdcwd-pathmax.c /usr/src/debug/strace/6.0-r0/src/xlat/mtd_nandecc_options.h /usr/src/debug/strace/6.0-r0/tests/fsmount.c /usr/src/debug/strace/6.0-r0/tests/ksysent.c /usr/src/debug/strace/6.0-r0/src/xlat/falloc_flags.h /usr/src/debug/strace/6.0-r0/tests/fallocate.c /usr/src/debug/strace/6.0-r0/src/xlat/uring_op_flags.h /usr/src/debug/strace/6.0-r0/tests/ftruncate.c /usr/src/debug/strace/6.0-r0/tests/clock_nanosleep.c /usr/src/debug/strace/6.0-r0/tests/prctl-securebits.c /usr/src/debug/strace/6.0-r0/tests/so_peercred.c /usr/src/debug/strace/6.0-r0/tests/sched_xetparam.c /usr/src/debug/strace/6.0-r0/tests/faccessat2
 .c /usr/src/debug/strace/6.0-r0/tests/xgetrlimit.c /usr/src/debug/strace/6.0-r0/tests/fadvise64.c /usr/src/debug/strace/6.0-r0/tests/printpath-umovestr-undumpable.c /usr/src/debug/strace/6.0-r0/src/xlat/memfd_create_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_neightbl_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_tuner_rxsubchanses.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_info_data_tun_attrs.h /usr/src/debug/strace/6.0-r0/tests/nlattr_ifla_port.c /usr/src/debug/strace/6.0-r0/tests/nfnetlink_ctnetlink_exp.c /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_mdba_mdb_eattr_attrs.h /usr/src/debug/strace/6.0-r0/tests/nlattr_inet_diag_msg.c /usr/src/debug/strace/6.0-r0/tests/nlattr_unix_diag_msg.c /usr/src/debug/strace/6.0-r0/src/xlat/fiemap_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/mremap_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/get_mempolicy_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_features_compat.h /usr/src/debug/strace/6.0-r0/tests/nfnetlink_ctnetlink
 .c /usr/src/debug/strace/6.0-r0/src/xlat/nf_nft_compat_msg_types.h /usr/src/debug/strace/6.0-r0/src/xlat/sigpoll_codes.h /usr/src/debug/strace/6.0-r0/src/xlat/sigprof_codes.h /usr/src/debug/strace/6.0-r0/tests/qual_inject-signal.c /usr/src/debug/strace/6.0-r0/src/xlat/ioprio_who.h /usr/src/debug/strace/6.0-r0/src/xlat/iffflags.h /usr/src/debug/strace/6.0-r0/tests/brk.c /usr/src/debug/strace/6.0-r0/src/xlat/netlink_sk_meminfo_indices.h /usr/src/debug/strace/6.0-r0/src/xlat/inotify_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/nl_selinux_types.h /usr/src/debug/strace/6.0-r0/src/xlat/neighbor_cache_entry_states.h /usr/src/debug/strace/6.0-r0/src/xlat/inet_diag_bpf_storage_attrs.h /usr/src/debug/strace/6.0-r0/tests/getegid32.c /usr/src/debug/strace/6.0-r0/tests/geteuid32.c /usr/src/debug/strace/6.0-r0/src/xlat/sigfpe_codes.h /usr/src/debug/strace/6.0-r0/tests/readahead.c /usr/src/debug/strace/6.0-r0/tests/netlink_xfrm.c /usr/src/debug/strace/6.0-r0/src/xlat/uffd_api_features.h /usr/src/
 debug/strace/6.0-r0/tests/mknodat.c /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ip6mra_creport_attr.h /usr/src/debug/strace/6.0-r0/tests/status-unfinished-threads.c /usr/src/debug/strace/6.0-r0/src/xlat/xdp_sockaddr_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_alg_options.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_ipx_options.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_kcm_options.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_llc_options.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_pnp_options.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_raw_options.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_rds_options.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_tcp_options.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_tls_options.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_udp_options.h /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_qgroup_status_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/sg_io_dxfer_direction.h /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_framesize_types.h /usr/src/debug/
 strace/6.0-r0/src/xlat/sa_handler_values.h /usr/src/debug/strace/6.0-r0/tests/prctl-cap-ambient.c /usr/src/debug/strace/6.0-r0/src/xlat/uring_iowq_acct.h /usr/src/debug/strace/6.0-r0/src/xlat/mtd_flags_options.h /usr/src/debug/strace/6.0-r0/src/xlat/uring_setup_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/bpf_query_flags.h /usr/src/debug/strace/6.0-r0/tests/nlattr_ifla_xdp.c /usr/src/debug/strace/6.0-r0/tests/prctl-spec-inject.c /usr/src/debug/strace/6.0-r0/tests/pc.c /usr/src/debug/strace/6.0-r0/src/xlat/priorities.h /usr/src/debug/strace/6.0-r0/src/xlat/nfc_sockaddr_protocols.h /usr/src/debug/strace/6.0-r0/src/xlat/mount_attr_attr.h /usr/src/debug/strace/6.0-r0/src/xlat/resources.h /usr/src/debug/strace/6.0-r0/src/xlat/faccessat_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_dev_stats_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_packet_options.h /usr/src/debug/strace/6.0-r0/tests/process_vm_readv_writev.c /usr/src/debug/strace/6.0-r0/tests/xselect.c /usr/src/debug/stra
 ce/6.0-r0/src/xlat/btrfs_dev_replace_cmds.h /usr/src/debug/strace/6.0-r0/tests/nlattr_inet_diag_req_v2.c /usr/src/debug/strace/6.0-r0/tests/read-write.c /usr/src/debug/strace/6.0-r0/tests/tee.c /usr/src/debug/strace/6.0-r0/tests/remap_file_pages.c /usr/src/debug/strace/6.0-r0/tests/seccomp_get_notif_sizes.c /usr/src/debug/strace/6.0-r0/tests/vmsplice.c /usr/src/debug/strace/6.0-r0/src/xlat/cap.h /usr/src/debug/strace/6.0-r0/src/xlat/nl_route_types.h /usr/src/debug/strace/6.0-r0/tests/semop-indirect.c /usr/src/debug/strace/6.0-r0/tests/hexdump_strdup.c /usr/src/debug/strace/6.0-r0/src/xlat/sock_xdp_options.h /usr/src/debug/strace/6.0-r0/src/xlat/ubi_volume_types.h /usr/src/debug/strace/6.0-r0/tests/int_0x80.c /usr/src/debug/strace/6.0-r0/src/xlat/tee_ioctl_param_attr_types.h /usr/src/debug/strace/6.0-r0/tests/epoll_create1.c /usr/src/debug/strace/6.0-r0/tests/ioctl_counter.c /usr/src/debug/strace/6.0-r0/src/xlat/kexec_arch_values.h /usr/src/debug/strace/6.0-r0/tests/sched_xetschedule
 r.c /usr/src/debug/strace/6.0-r0/src/xlat/ptp_extts_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/tcp_state_flags.h /usr/src/debug/strace/6.0-r0/tests/maybe_switch_current_tcp.c /usr/src/debug/strace/6.0-r0/src/xlat/sysctl_kern.h /usr/src/debug/strace/6.0-r0/tests/print_user_desc.c /usr/src/debug/strace/6.0-r0/tests/btrfs.c /usr/src/debug/strace/6.0-r0/tests/chdir.c /usr/src/debug/strace/6.0-r0/tests/chmod.c /usr/src/debug/strace/6.0-r0/tests/delay.c /usr/src/debug/strace/6.0-r0/tests/dirfd.c /usr/src/debug/strace/6.0-r0/tests/xattr.c /usr/src/debug/strace/6.0-r0/tests/pause.c /usr/src/debug/strace/6.0-r0/src/xlat/sock_iucv_options.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_sctp_options.h /usr/src/debug/strace/6.0-r0/tests/mlock.c /usr/src/debug/strace/6.0-r0/tests/ioctl_fs_x.c /usr/src/debug/strace/6.0-r0/src/xlat/hw_breakpoint_len.h /usr/src/debug/strace/6.0-r0/src/xlat/netlink_new_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/kd_kbd_modes.h /usr/src/debug/strace/6.0-r0/src/xlat
 /kd_kbd_types.h /usr/src/debug/strace/6.0-r0/src/xlat/kd_key_types.h /usr/src/debug/strace/6.0-r0/src/xlat/membarrier_flags.h /usr/src/debug/strace/6.0-r0/tests/old_mmap.c /usr/src/debug/strace/6.0-r0/tests/netlink_generic.c /usr/src/debug/strace/6.0-r0/src/xlat/kd_key_shift_keys.h /usr/src/debug/strace/6.0-r0/tests/printsignal.c /usr/src/debug/strace/6.0-r0/tests/qual_signal.c /usr/src/debug/strace/6.0-r0/tests/dev-yy.c /usr/src/debug/strace/6.0-r0/tests/attach-p-cmd-cmd.c /usr/src/debug/strace/6.0-r0/tests/riscv_flush_icache.c /usr/src/debug/strace/6.0-r0/src/xlat/landlock_ruleset_access_fs.h /usr/src/debug/strace/6.0-r0/tests/execveat--secontext.c /usr/src/debug/strace/6.0-r0/src/xlat/multicast_router_types.h /usr/src/debug/strace/6.0-r0/src/xlat/fsconfig_cmds.h /usr/src/debug/strace/6.0-r0/src/xlat/ax25_protocols.h /usr/src/debug/strace/6.0-r0/tests/prctl-no-args.c /usr/src/debug/strace/6.0-r0/tests/execve.c /usr/src/debug/strace/6.0-r0/tests/ptrace.c /usr/src/debug/strace/6.0-r
 0/tests/rename.c /usr/src/debug/strace/6.0-r0/tests/splice.c /usr/src/debug/strace/6.0-r0/src/xlat/kd_key_fn_key_vals.h /usr/src/debug/strace/6.0-r0/src/xlat/nl_bridge_vlan_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/mount_setattr_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_device_capabilities_flags.h /usr/src/debug/strace/6.0-r0/tests/getpeername.c /usr/src/debug/strace/6.0-r0/src/xlat/bpf_test_run_flags.h /usr/src/debug/strace/6.0-r0/tests/sigaltstack.c /usr/src/debug/strace/6.0-r0/tests/block_reset_run.c /usr/src/debug/strace/6.0-r0/src/xlat/prctl_options.h /usr/src/debug/strace/6.0-r0/tests/ioctl_scsi.c /usr/src/debug/strace/6.0-r0/tests/quotactl-xfs.c /usr/src/debug/strace/6.0-r0/tests/prctl-name.c /usr/src/debug/strace/6.0-r0/tests/ioprio.c /usr/src/debug/strace/6.0-r0/tests/times-fail.c /usr/src/debug/strace/6.0-r0/tests/umode_t.c /usr/src/debug/strace/6.0-r0/src/xlat/landlock_create_ruleset_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/nl_netfilter_msg_types.h /usr/
 src/debug/strace/6.0-r0/tests/nlattr_mdba_mdb_entry.c /usr/src/debug/strace/6.0-r0/src/xlat/fsmount_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/baud_options.h /usr/src/debug/strace/6.0-r0/tests/print_maxfd.c /usr/src/debug/strace/6.0-r0/tests/erestartsys.c /usr/src/debug/strace/6.0-r0/src/xlat/if_dqinfo_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_nexthop_grp_types.h /usr/src/debug/strace/6.0-r0/src/xlat/audit_arch.h /usr/src/debug/strace/6.0-r0/tests/fspick.c /usr/src/debug/strace/6.0-r0/tests/llseek.c /usr/src/debug/strace/6.0-r0/tests/unlink.c /usr/src/debug/strace/6.0-r0/tests/ioctl_block.c /usr/src/debug/strace/6.0-r0/src/xlat/futex_waiter_flags.h /usr/src/debug/strace/6.0-r0/tests/nfnetlink_ipset.c /usr/src/debug/strace/6.0-r0/tests/ioperm.c /usr/src/debug/strace/6.0-r0/src/xlat/pr_sched_core_pidtypes.h /usr/src/debug/strace/6.0-r0/src/xlat/bpf_map_flags.h /usr/src/debug/strace/6.0-r0/tests/unix-pair-send-recv.c /usr/src/debug/strace/6.0-r0/src/xlat/tee_ioctl_max_arg_s
 ize.h /usr/src/debug/strace/6.0-r0/src/xlat/qipcrtr_nodes.h /usr/src/debug/strace/6.0-r0/tests/newfstatat.c /usr/src/debug/strace/6.0-r0/src/xlat/nf_osf_msg_types.h /usr/src/debug/strace/6.0-r0/src/xlat/af_packet_types.h /usr/src/debug/strace/6.0-r0/src/xlat/ifstats_xstats_bond_3ad_attrs.h /usr/src/debug/strace/6.0-r0/tests/ioctl_loop.c /usr/src/debug/strace/6.0-r0/src/xlat/keyctl_pkey_ops.h /usr/src/debug/strace/6.0-r0/tests/uio.c /usr/src/debug/strace/6.0-r0/tests/nanosleep.c /usr/src/debug/strace/6.0-r0/src/xlat/sigbus_codes.h /usr/src/debug/strace/6.0-r0/src/xlat/landlock_rule_types.h /usr/src/debug/strace/6.0-r0/tests/sched_xetaffinity.c /usr/src/debug/strace/6.0-r0/src/xlat/nt_descriptor_types.h /usr/src/debug/strace/6.0-r0/src/xlat/x86_xfeature_bits.h /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_defrag_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/umount_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/alg_sockaddr_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_tc_attrs.h /us
 r/src/debug/strace/6.0-r0/src/xlat/ethernet_protocols.h /usr/src/debug/strace/6.0-r0/tests/time_enjoyment.h /usr/src/debug/strace/6.0-r0/tests/truncate.c /usr/src/debug/strace/6.0-r0/src/xlat/resource_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/ipc_msg_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/packet_diag_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/open_access_modes.h /usr/src/debug/strace/6.0-r0/src/xlat/kd_font_flags.h /usr/src/debug/strace/6.0-r0/tests/net-icmp_filter.c /usr/src/debug/strace/6.0-r0/src/xlat/netlink_get_flags.h /usr/src/debug/strace/6.0-r0/tests/set_sigblock.c /usr/src/debug/strace/6.0-r0/src/xlat/whence_codes.h /usr/src/debug/strace/6.0-r0/tests/getgid32.c /usr/src/debug/strace/6.0-r0/tests/getuid32.c /usr/src/debug/strace/6.0-r0/src/xlat/uring_restriction_opcodes.h /usr/src/debug/strace/6.0-r0/tests/nlattr_ifaddrlblmsg.c /usr/src/debug/strace/6.0-r0/tests/s390_pci_mmio_read_write.c /usr/src/debug/strace/6.0-r0/src/xlat/scmvals.h /usr/src/debug/strace/6.0
 -r0/src/xlat/rtnl_ipmra_creport_attr.h /usr/src/debug/strace/6.0-r0/tests/sigreturn.c /usr/src/debug/strace/6.0-r0/tests/xet_robust_list.c /usr/src/debug/strace/6.0-r0/tests/socketcall.c /usr/src/debug/strace/6.0-r0/tests/futex_waitv.c /usr/src/debug/strace/6.0-r0/src/xlat/bpf_miscop.h /usr/src/debug/strace/6.0-r0/src/xlat/bpf_op_alu.h /usr/src/debug/strace/6.0-r0/src/xlat/bpf_op_jmp.h /usr/src/debug/strace/6.0-r0/tests/add_key.c /usr/src/debug/strace/6.0-r0/src/xlat/kvm_exit_reason.h /usr/src/debug/strace/6.0-r0/tests/net-sockaddr.c /usr/src/debug/strace/6.0-r0/src/xlat/if_dqblk_valid.h /usr/src/debug/strace/6.0-r0/src/xlat/sysctl_vm.h /usr/src/debug/strace/6.0-r0/tests/sigpending.c /usr/src/debug/strace/6.0-r0/tests/munlockall.c /usr/src/debug/strace/6.0-r0/tests/prctl-pdeathsig.c /usr/src/debug/strace/6.0-r0/src/xlat/sigsys_codes.h /usr/src/debug/strace/6.0-r0/tests/seccomp-filter-v.c /usr/src/debug/strace/6.0-r0/tests/printstrn-umoven.c /usr/src/debug/strace/6.0-r0/src/xlat/fute
 xops.h /usr/src/debug/strace/6.0-r0/tests/sync_file_range2.c /usr/src/debug/strace/6.0-r0/tests/linkat--secontext.c /usr/src/debug/strace/6.0-r0/tests/openat--secontext.c /usr/src/debug/strace/6.0-r0/tests/init_module.c /usr/src/debug/strace/6.0-r0/tests/recv-MSG_TRUNC.c /usr/src/debug/strace/6.0-r0/src/xlat/sigaltstack_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/msgctl_flags.h /usr/src/debug/strace/6.0-r0/tests/status-none.c /usr/src/debug/strace/6.0-r0/src/xlat/bpf_prog_types.h /usr/src/debug/strace/6.0-r0/src/xlat/fsmount_attr_flags.h /usr/src/debug/strace/6.0-r0/tests/orphaned_process_group.c /usr/src/debug/strace/6.0-r0/src/xlat/mdb_states.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_mdba_mdb_attrs.h /usr/src/debug/strace/6.0-r0/tests/clock_adjtime-common.c /usr/src/debug/strace/6.0-r0/tests/pidns.c /usr/src/debug/strace/6.0-r0/tests/pipe2.c /usr/src/debug/strace/6.0-r0/src/xlat/ubi_volume_flags.h /usr/src/debug/strace/6.0-r0/tests/wait4.c /usr/src/debug/strace/6.0-r0/tests/n
 lattr_inet_diag_req_compat.c /usr/src/debug/strace/6.0-r0/tests/statx.c /usr/src/debug/strace/6.0-r0/tests/fsync.c /usr/src/debug/strace/6.0-r0/tests/futex.c /usr/src/debug/strace/6.0-r0/tests/ioctl.c /usr/src/debug/strace/6.0-r0/tests/lseek.c /usr/src/debug/strace/6.0-r0/src/xlat/smc_diag_extended_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/netlink_socket_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/evdev_keycode.h /usr/src/debug/strace/6.0-r0/tests/ipc_sem.c /usr/src/debug/strace/6.0-r0/tests/print_quoted_string.c /usr/src/debug/strace/6.0-r0/src/xlat/uffd_flags.h /usr/src/debug/strace/6.0-r0/tests/netlink_crypto.c /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_balance_state.h /usr/src/debug/strace/6.0-r0/tests/get_mempolicy.c /usr/src/debug/strace/6.0-r0/tests/set_mempolicy.c /usr/src/debug/strace/6.0-r0/tests/strace-p1-Y-p.c /usr/src/debug/strace/6.0-r0/tests/rt_sigreturn.c /usr/src/debug/strace/6.0-r0/src/xlat/bluetooth_l2_psm.h /usr/src/debug/strace/6.0-r0/tests/pread64-pwrite
 64.c /usr/src/debug/strace/6.0-r0/src/xlat/ipc_private.h /usr/src/debug/strace/6.0-r0/tests/xgetdents.c /usr/src/debug/strace/6.0-r0/tests/prctl-sched-core.c /usr/src/debug/strace/6.0-r0/src/xlat/isdn_protocols.h /usr/src/debug/strace/6.0-r0/src/xlat/ioprio_class.h /usr/src/debug/strace/6.0-r0/src/xlat/efd_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/sfd_flags.h /usr/src/debug/strace/6.0-r0/tests/sprintrc.c /usr/src/debug/strace/6.0-r0/src/xlat/uring_enter_flags.h /usr/src/debug/strace/6.0-r0/tests/nlattr_crypto_user_alg.c /usr/src/debug/strace/6.0-r0/src/xlat/keyctl_caps0.h /usr/src/debug/strace/6.0-r0/src/xlat/pr_spec_get_store_bypass_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/pr_spec_set_store_bypass_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_control_ids.h /usr/src/debug/strace/6.0-r0/src/xlat/bsg_subprotocol.h /usr/src/debug/strace/6.0-r0/tests/qual_fault.c /usr/src/debug/strace/6.0-r0/tests/epoll_pwait2.c /usr/src/debug/strace/6.0-r0/tests/clone_parent.c /usr/src/de
 bug/strace/6.0-r0/tests/clone_ptrace.c /usr/src/debug/strace/6.0-r0/src/xlat/gpio_line_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/dirent_types.h /usr/src/debug/strace/6.0-r0/tests/getresugid.c /usr/src/debug/strace/6.0-r0/tests/setresugid.c /usr/src/debug/strace/6.0-r0/src/xlat/nf_nftables_msg_types.h /usr/src/debug/strace/6.0-r0/tests/getdents64.c /usr/src/debug/strace/6.0-r0/src/xlat/kcm_protocols.h /usr/src/debug/strace/6.0-r0/tests/kexec_file_load.c /usr/src/debug/strace/6.0-r0/src/xlat/arp_hardware_types.h /usr/src/debug/strace/6.0-r0/src/xlat/uring_register_rsrc_flags.h /usr/src/debug/strace/6.0-r0/tests/is_linux_mips_n64.c /usr/src/debug/strace/6.0-r0/src/xlat/icmpfilterflags.h /usr/src/debug/strace/6.0-r0/src/xlat/futexbitset.h /usr/src/debug/strace/6.0-r0/src/xlat/inet_diag_ulp_info_tls_attrs.h /usr/src/debug/strace/6.0-r0/tests/fanotify_mark--secontext.c /usr/src/debug/strace/6.0-r0/tests/inode_of_sockfd.c /usr/src/debug/strace/6.0-r0/tests/ipc.c /usr/src/debug/strace/6
 .0-r0/src/xlat/modem_flags.h /usr/src/debug/strace/6.0-r0/tests/xstatfsx.c /usr/src/debug/strace/6.0-r0/tests/file_handle--secontext.c /usr/src/debug/strace/6.0-r0/src/xlat/getsock_ipv6_options.h /usr/src/debug/strace/6.0-r0/src/xlat/setsock_ipv6_options.h /usr/src/debug/strace/6.0-r0/tests/fchmodat--secontext.c /usr/src/debug/strace/6.0-r0/src/xlat/inet_diag_req_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/inet_diag_ulp_info_mptcp_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/module_init_flags.h /usr/src/debug/strace/6.0-r0/tests/run_expect_termsig.c /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_mdba_router_pattr_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/inet_protocols.h /usr/src/debug/strace/6.0-r0/tests/overflowuid.c /usr/src/debug/strace/6.0-r0/src/xlat/smc_link_group_roles.h /usr/src/debug/strace/6.0-r0/src/xlat/bsg_protocol.h /usr/src/debug/strace/6.0-r0/src/xlat/counter_ioctl_component_types.h /usr/src/debug/strace/6.0-r0/tests/sigprocmask.c /usr/src/debug/strace/6.0-r0/src
 /xlat/ip_cmsg_types.h /usr/src/debug/strace/6.0-r0/tests/restart_syscall.c /usr/src/debug/strace/6.0-r0/src/xlat/pollflags.h /usr/src/debug/strace/6.0-r0/src/xlat/sigact_flags.h /usr/src/debug/strace/6.0-r0/tests/rt_tgsigqueueinfo.c /usr/src/debug/strace/6.0-r0/src/xlat/skf_ad.h /usr/src/debug/strace/6.0-r0/src/xlat/mlock_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/vsock_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/vsock_ports.h /usr/src/debug/strace/6.0-r0/tests/xettimeofday.c /usr/src/debug/strace/6.0-r0/tests/secontext.h /usr/src/debug/strace/6.0-r0/tests/kernel_version.c /usr/src/debug/strace/6.0-r0/tests/nlattr_tc_stats.c /usr/src/debug/strace/6.0-r0/src/xlat/netlink_flags.h /usr/src/debug/strace/6.0-r0/tests/printstrn-umoven-undumpable.c /usr/src/debug/strace/6.0-r0/src/xlat/evdev_leds.h /usr/src/debug/strace/6.0-r0/src/xlat/evdev_misc.h /usr/src/debug/strace/6.0-r0/src/xlat/evdev_prop.h /usr/src/debug/strace/6.0-r0/tests/netlink_inet_diag.c /usr/src/debug/strace/6.0-r0/tes
 ts/netlink_sock_diag.c /usr/src/debug/strace/6.0-r0/tests/netlink_unix_diag.c /usr/src/debug/strace/6.0-r0/src/xlat/shm_resource_flags.h /usr/src/debug/strace/6.0-r0/tests/netlink_audit.c /usr/src/debug/strace/6.0-r0/tests/netlink_route.c /usr/src/debug/strace/6.0-r0/src/xlat/bpf_file_mode_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/key_spec.h /usr/src/debug/strace/6.0-r0/src/xlat/kd_font_ops.h /usr/src/debug/strace/6.0-r0/tests/segv_accerr.c /usr/src/debug/strace/6.0-r0/src/xlat/kd_key_spec_keys.h /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_tuner_capabilities.h /usr/src/debug/strace/6.0-r0/tests/delete_module.c /usr/src/debug/strace/6.0-r0/tests/prctl-syscall-user-dispatch.c /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_vf_info_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_vf_port_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/xfs_dqblk_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/xfs_quota_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_pppol2tp_options.h /usr/src/
 debug/strace/6.0-r0/src/xlat/mctp_nets.h /usr/src/debug/strace/6.0-r0/src/xlat/bpf_prog_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_fs_info_flags.h /usr/src/debug/strace/6.0-r0/tests/setrlimit.c /usr/src/debug/strace/6.0-r0/tests/recvfrom.c /usr/src/debug/strace/6.0-r0/src/xlat/seccomp_ioctl_resp_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/statx_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/statx_masks.h /usr/src/debug/strace/6.0-r0/src/xlat/fsmagic.h /usr/src/debug/strace/6.0-r0/src/xlat/hci_channels.h /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_space_info_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/kd_key_fn_keys.h /usr/src/debug/strace/6.0-r0/tests/mq_sendrecv.c /usr/src/debug/strace/6.0-r0/src/xlat/fspick_flags.h /usr/src/debug/strace/6.0-r0/tests/status-all.c /usr/src/debug/strace/6.0-r0/tests/close_range.c /usr/src/debug/strace/6.0-r0/tests/ioctl_fiemap.c /usr/src/debug/strace/6.0-r0/src/xlat/packet_diag_info_flags.h /usr/src/debug/strace/6.0-r0/tests/status-none-t
 hreads.c /usr/src/debug/strace/6.0-r0/src/xlat/clone_flags.h /usr/src/debug/strace/6.0-r0/tests/xchownx.c /usr/src/debug/strace/6.0-r0/src/xlat/in6_addr_gen_mode.h /usr/src/debug/strace/6.0-r0/src/xlat/sysctl_net_ipv6.h /usr/src/debug/strace/6.0-r0/src/xlat/inet_diag_bytecodes.h /usr/src/debug/strace/6.0-r0/src/xlat/inet6_devconf_indices.h /usr/src/debug/strace/6.0-r0/tests/ipc_msgbuf.c /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_send_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/perf_ioctl_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/sysctl_net_ipv4.h /usr/src/debug/strace/6.0-r0/src/xlat/timerfdflags.h /usr/src/debug/strace/6.0-r0/tests/pidfd_getfd.c /usr/src/debug/strace/6.0-r0/src/xlat/nl_crypto_types.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_vf_link_states.h /usr/src/debug/strace/6.0-r0/tests/ioctl_perf.c /usr/src/debug/strace/6.0-r0/src/xlat/sock_ip_options.h /usr/src/debug/strace/6.0-r0/src/xlat/open_resolve_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_af_
 spec_inet_attrs.h /usr/src/debug/strace/6.0-r0/tests/membarrier.c /usr/src/debug/strace/6.0-r0/src/xlat/adjtimex_status.h /usr/src/debug/strace/6.0-r0/tests/nfnetlink_cttimeout.c /usr/src/debug/strace/6.0-r0/tests/rt_sigtimedwait.c /usr/src/debug/strace/6.0-r0/tests/readlinkat.c /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_br_boolopt_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_type_flags.h /usr/src/debug/strace/6.0-r0/tests/qual_inject-retval.c /usr/src/debug/strace/6.0-r0/tests/localtime.c /usr/src/debug/strace/6.0-r0/tests/nfnetlink_ulog.c /usr/src/debug/strace/6.0-r0/src/xlat/tee_ioctl_impl_ids.h /usr/src/debug/strace/6.0-r0/src/xlat/mq_attr_flags.h /usr/src/debug/strace/6.0-r0/tests/check_sigign.c /usr/src/debug/strace/6.0-r0/tests/memfd_secret.c /usr/src/debug/strace/6.0-r0/tests/fchmod--secontext.c /usr/src/debug/strace/6.0-r0/src/xlat/netlink_diag_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/rxrpc_services.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_can_raw_option
 s.h /usr/src/debug/strace/6.0-r0/tests/shutdown.c /usr/src/debug/strace/6.0-r0/src/xlat/ubi_volume_props.h /usr/src/debug/strace/6.0-r0/src/xlat/tee_ioctl_shm_flags.h /usr/src/debug/strace/6.0-r0/tests/signal2name.c /usr/src/debug/strace/6.0-r0/src/xlat/bpf_class.h /usr/src/debug/strace/6.0-r0/src/xlat/rwf_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/gpio_v2_line_flags.h /usr/src/debug/strace/6.0-r0/tests/xet_thread_area_x86.c /usr/src/debug/strace/6.0-r0/tests/landlock_add_rule.c /usr/src/debug/strace/6.0-r0/tests/ioctl_kvm_run.c /usr/src/debug/strace/6.0-r0/src/xlat/pr_cap_ambient.h /usr/src/debug/strace/6.0-r0/tests/kern_features.c /usr/src/debug/strace/6.0-r0/src/xlat/netlink_types.h /usr/src/debug/strace/6.0-r0/src/xlat/getsock_options.h /usr/src/debug/strace/6.0-r0/src/xlat/setsock_options.h /usr/src/debug/strace/6.0-r0/src/xlat/blkpg_ops.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_tipc_options.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_mdba_mdb_entry_attrs.h /usr/src/debu
 g/strace/6.0-r0/src/xlat/sock_ax25_options.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_caif_options.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_dccp_options.h /usr/src/debug/strace/6.0-r0/src/xlat/ioctl_dirs.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_ipv6_options.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_irda_options.h /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_features_incompat.h /usr/src/debug/strace/6.0-r0/tests/umovestr3.c /usr/src/debug/strace/6.0-r0/src/xlat/nf_acct_msg_types.h /usr/src/debug/strace/6.0-r0/src/xlat/uring_setup_features.h /usr/src/debug/strace/6.0-r0/src/xlat/evdev_ff_types.h /usr/src/debug/strace/6.0-r0/src/xlat/perf_hw_cache_id.h /usr/src/debug/strace/6.0-r0/tests/symlinkat.c /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_nha_res_bucket_attrs.h /usr/src/debug/strace/6.0-r0/tests/check_sigblock.c /usr/src/debug/strace/6.0-r0/tests/nlattr_ifla_af_inet6.h /usr/src/debug/strace/6.0-r0/src/xlat/perf_event_open_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/cap_
 version.h /usr/src/debug/strace/6.0-r0/tests/nlattr_nlmsgerr.c /usr/src/debug/strace/6.0-r0/tests/ioctl_fs_f.c /usr/src/debug/strace/6.0-r0/tests/access--secontext.c /usr/src/debug/strace/6.0-r0/src/xlat/inet_diag_bpf_storages_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_format_description_flags.h /usr/src/debug/strace/6.0-r0/tests/list_sigaction_signum.c /usr/src/debug/strace/6.0-r0/tests/printpath-umovestr-peekdata.c /usr/src/debug/strace/6.0-r0/src/xlat/af_packet_versions.h /usr/src/debug/strace/6.0-r0/src/xlat/tee_ioctl_login_types.h /usr/src/debug/strace/6.0-r0/src/xlat/ifstats_offload_attrs.h /usr/src/debug/strace/6.0-r0/tests/open_tree.c /usr/src/debug/strace/6.0-r0/tests/tprintf.c /usr/src/debug/strace/6.0-r0/src/xlat/siginfo_codes.h /usr/src/debug/strace/6.0-r0/tests/net-accept-connect.c /usr/src/debug/strace/6.0-r0/src/xlat/bpf_size.h /usr/src/debug/strace/6.0-r0/src/xlat/semctl_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/shmctl_flags.h /usr/src/debug/strace/6.0-r0
 /tests/ioctl_kvm_run_common.c /usr/src/debug/strace/6.0-r0/src/xlat/evdev_relative_axes.h /usr/src/debug/strace/6.0-r0/tests/landlock_create_ruleset.c /usr/src/debug/strace/6.0-r0/src/xlat/bpf_map_lookup_elem_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/pr_tsc.h /usr/src/debug/strace/6.0-r0/src/xlat/perf_hw_cache_op_result_id.h /usr/src/debug/strace/6.0-r0/tests/mmsg-silent.c /usr/src/debug/strace/6.0-r0/src/xlat/sock_options.h /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_key_types.h /usr/src/debug/strace/6.0-r0/src/xlat/tls_info_versions.h /usr/src/debug/strace/6.0-r0/src/xlat/sigev_value.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_af_spec_bridge_vlan_tunnel_info_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/ptrace_syscall_info_op.h /usr/src/debug/strace/6.0-r0/src/xlat/sysctl_root.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_nexthop_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_sliced_flags.h /usr/src/debug/strace/6.0-r0/tests/looping_threads.c /usr/src/debug/strace/6.0
 -r0/tests/nlattr_ifla_proto_down_reason.c /usr/src/debug/strace/6.0-r0/tests/rt_sigpending.c /usr/src/debug/strace/6.0-r0/src/xlat/snmp_ip_stats.h /usr/src/debug/strace/6.0-r0/tests/sched_rr_get_interval.c /usr/src/debug/strace/6.0-r0/src/xlat/netlink_ack_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_tc_action_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/cap_mask0.h /usr/src/debug/strace/6.0-r0/src/xlat/cap_mask1.h /usr/src/debug/strace/6.0-r0/src/xlat/xdp_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_events.h /usr/src/debug/strace/6.0-r0/tests/seccomp_get_action_avail.c /usr/src/debug/strace/6.0-r0/src/xlat/if_dqinfo_valid.h /usr/src/debug/strace/6.0-r0/src/xlat/inet_diag_attrs.h /usr/src/debug/strace/6.0-r0/tests/clone-flags.c /usr/src/debug/strace/6.0-r0/tests/getpgrp.c /usr/src/debug/strace/6.0-r0/tests/umovestr_cached_adjacent.c /usr/src/debug/strace/6.0-r0/src/xlat/bootflags1.h /usr/src/debug/strace/6.0-r0/src/xlat/bootflags2.h /usr/src/debug/strace/6.0-r0/src/
 xlat/bootflags3.h /usr/src/debug/strace/6.0-r0/src/xlat/quotatypes.h /usr/src/debug/strace/6.0-r0/tests/execveat.c /usr/src/debug/strace/6.0-r0/tests/renameat.c /usr/src/debug/strace/6.0-r0/src/xlat/mtd_mode_options.h /usr/src/debug/strace/6.0-r0/src/xlat/mtd_type_options.h /usr/src/debug/strace/6.0-r0/tests/strace-x.c /usr/src/debug/strace/6.0-r0/tests/dup.c /usr/src/debug/strace/6.0-r0/tests/ioctl_nbd.c /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_af_spec_inet6_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/perf_hw_id.h /usr/src/debug/strace/6.0-r0/tests/fadvise64_64.c /usr/src/debug/strace/6.0-r0/tests/ptrace_syscall_info.c /usr/src/debug/strace/6.0-r0/tests/unix-pair-sendto-recvfrom.c /usr/src/debug/strace/6.0-r0/tests/stack-fcall.c /usr/src/debug/strace/6.0-r0/src/xlat/ebpf_class.h /usr/src/debug/strace/6.0-r0/tests/stack-fcall.h /usr/src/debug/strace/6.0-r0/tests/attach-f-p.c /usr/src/debug/strace/6.0-r0/src/xlat/pr_mce_kill_policy.h /usr/src/debug/strace/6.0-r0/src/xlat/nf_
 ipset_msg_types.h /usr/src/debug/strace/6.0-r0/src/xlat/routing_scopes.h /usr/src/debug/strace/6.0-r0/src/xlat/kd_key_lock_keys.h /usr/src/debug/strace/6.0-r0/src/xlat/syslog_action_type.h /usr/src/debug/strace/6.0-r0/tests/oldselect.c /usr/src/debug/strace/6.0-r0/tests/bpf.c /usr/src/debug/strace/6.0-r0/src/xlat/open_mode_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/open_tree_flags.h /usr/src/debug/strace/6.0-r0/tests/get_process_reaper.c /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_dev_stats_values.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_neigh_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_route_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/ebpf_op_alu.h /usr/src/debug/strace/6.0-r0/tests/group_req.c /usr/src/debug/strace/6.0-r0/src/xlat/bsg_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/msg_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_bluetooth_options.h /usr/src/debug/strace/6.0-r0/src/xlat/ifstats_attr_flags.h /usr/src/debug/strace/6.0-r0/tests/unblock_reset_raise
 .c /usr/src/debug/strace/6.0-r0/tests/threads-execve.c /usr/src/debug/strace/6.0-r0/tests/s390_runtime_instr.c /usr/src/debug/strace/6.0-r0/tests/strace-n.c /usr/src/debug/strace/6.0-r0/src/xlat/bpf_rval.h /usr/src/debug/strace/6.0-r0/tests/renameat2.c /usr/src/debug/strace/6.0-r0/tests/modify_ldt.c /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_info_attrs.h /usr/src/debug/strace/6.0-r0/tests/fcntl64.c /usr/src/debug/strace/6.0-r0/tests/ioctl_random.c /usr/src/debug/strace/6.0-r0/src/xlat/kd_keymap_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/caif_protocols.h /usr/src/debug/strace/6.0-r0/src/xlat/uring_ops.h /usr/src/debug/strace/6.0-r0/src/xlat/sysctl_net_ipv4_conf.h /usr/src/debug/strace/6.0-r0/tests/nfnetlink_nft_compat.c /usr/src/debug/strace/6.0-r0/src/xlat/counter_ioctl_event_types.h /usr/src/debug/strace/6.0-r0/tests/getgroups.c /usr/src/debug/strace/6.0-r0/tests/setgroups.c /usr/src/debug/strace/6.0-r0/tests/clock_xettime-common.c /usr/src/debug/strace/6.0-r0/tests/pselect
 6-common.c /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_proto_down_reason_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_af_spec_bridge_attrs.h /usr/src/debug/strace/6.0-r0/tests/ioctl_watchdog.c /usr/src/debug/strace/6.0-r0/src/xlat/sigsegv_codes.h /usr/src/debug/strace/6.0-r0/tests/ioctl_lirc.c /usr/src/debug/strace/6.0-r0/src/xlat/sg_io_flags.h /usr/src/debug/strace/6.0-r0/tests/vfork-f.c /usr/src/debug/strace/6.0-r0/tests/count-f.c /usr/src/debug/strace/6.0-r0/tests/mincore.c /usr/src/debug/strace/6.0-r0/tests/unshare.c /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_control_id_bases.h /usr/src/debug/strace/6.0-r0/tests/userfaultfd.c /usr/src/debug/strace/6.0-r0/tests/rt_sigaction.c /usr/src/debug/strace/6.0-r0/src/xlat/pr_tagged_addr_mte_tcf.h /usr/src/debug/strace/6.0-r0/tests/test_ucopy.c /usr/src/debug/strace/6.0-r0/tests/personality.c /usr/src/debug/strace/6.0-r0/tests/test_ucopy.h /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_cont_reading_from_srcdev_mode.h /usr/src/d
 ebug/strace/6.0-r0/src/xlat/pr_tagged_addr_enable.h /usr/src/debug/strace/6.0-r0/tests/request_key.c /usr/src/debug/strace/6.0-r0/src/xlat/epollctls.h /usr/src/debug/strace/6.0-r0/src/xlat/evdev_switch.h /usr/src/debug/strace/6.0-r0/tests/msg_name.c /usr/src/debug/strace/6.0-r0/tests/sockname.c /usr/src/debug/strace/6.0-r0/tests/semop.c /usr/src/debug/strace/6.0-r0/tests/setns.c /usr/src/debug/strace/6.0-r0/tests/shmxt.c /usr/src/debug/strace/6.0-r0/tests/sleep.c /usr/src/debug/strace/6.0-r0/tests/openat2.c /usr/src/debug/strace/6.0-r0/tests/umount2.c /usr/src/debug/strace/6.0-r0/src/xlat/mtd_file_mode_options.h /usr/src/debug/strace/6.0-r0/src/xlat/memfd_secret_flags.h /usr/src/debug/strace/6.0-r0/tests/set_ptracer_any.c /usr/src/debug/strace/6.0-r0/tests/ioctl_sg_io_v3.c /usr/src/debug/strace/6.0-r0/src/xlat/perf_attr_size.h /usr/src/debug/strace/6.0-r0/src/xlat/lwtunnel_encap_types.h /usr/src/debug/strace/6.0-r0/tests/nlattr_ifla.h /usr/src/debug/strace/6.0-r0/src/xlat/usagewho.h
  /usr/src/debug/strace/6.0-r0/src/xlat/nf_cthelper_msg_types.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_nha_res_group_attrs.h /usr/src/debug/strace/6.0-r0/tests/print_ppid_tracerpid.c /usr/src/debug/strace/6.0-r0/src/xlat/statfs_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/unix_diag_attrs.h /usr/src/debug/strace/6.0-r0/tests/prctl-capbset.c /usr/src/debug/strace/6.0-r0/tests/ioctl_tee.c /usr/src/debug/strace/6.0-r0/tests/printxval.c /usr/src/debug/strace/6.0-r0/tests/sock_filter-v.c /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_neightbl_parms_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/route_nexthop_flags.h /usr/src/debug/strace/6.0-r0/tests/process_mrelease.c /usr/src/debug/strace/6.0-r0/src/xlat/pidfd_open_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/kd_key_dead_keys.h /usr/src/debug/strace/6.0-r0/tests/s390_guarded_storage.c /usr/src/debug/strace/6.0-r0/tests/answer.c /usr/src/debug/strace/6.0-r0/tests/fchdir.c /usr/src/debug/strace/6.0-r0/tests/nlattr.c /usr/src/debug/strace/
 6.0-r0/tests/subdir.c /usr/src/debug/strace/6.0-r0/src/xlat/flockcmds.h /usr/src/debug/strace/6.0-r0/tests/ioctl_hdio.c /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_info_data_bridge_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/sysctl_net.h /usr/src/debug/strace/6.0-r0/src/xlat/inet_diag_ulp_info_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/ptp_pin_funcs.h /usr/src/debug/strace/6.0-r0/src/xlat/kd_default_led_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ip6mra_msg_types.h /usr/src/debug/strace/6.0-r0/tests/prctl-dumpable.c /usr/src/debug/strace/6.0-r0/tests/ioctl_evdev.c /usr/src/debug/strace/6.0-r0/tests/perf_event_open_nonverbose.c /usr/src/debug/strace/6.0-r0/tests/fork--pidns-translation.c /usr/src/debug/strace/6.0-r0/src/xlat/itimer_which.h /usr/src/debug/strace/6.0-r0/tests/epoll_ctl.c /usr/src/debug/strace/6.0-r0/src/xlat/unshare_flags.h /usr/src/debug/strace/6.0-r0/tests/pkey_alloc.c /usr/src/debug/strace/6.0-r0/tests/tail_alloc.c /usr/src/debug/strace/6.0-r0/src/xl
 at/btrfs_features_compat_ro.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ifla_xdp_attrs.h /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_frameinterval_types.h /usr/src/debug/strace/6.0-r0/src/xlat/bpf_commands.h /usr/src/debug/strace/6.0-r0/tests/faccessat.c /usr/src/debug/strace/6.0-r0/tests/getrandom.c /usr/src/debug/strace/6.0-r0/tests/fchmod.c /usr/src/debug/strace/6.0-r0/tests/getcwd.c /usr/src/debug/strace/6.0-r0/tests/getgid.c /usr/src/debug/strace/6.0-r0/tests/getpid.c /usr/src/debug/strace/6.0-r0/tests/getsid.c /usr/src/debug/strace/6.0-r0/tests/gettid.c /usr/src/debug/strace/6.0-r0/tests/getuid.c /usr/src/debug/strace/6.0-r0/tests/waitid.c /usr/src/debug/strace/6.0-r0/tests/vhangup.c /usr/src/debug/strace/6.0-r0/tests/fork-f.c /usr/src/debug/strace/6.0-r0/src/xlat/nf_ctnetlink_exp_msg_types.h /usr/src/debug/strace/6.0-r0/src/xlat/rtnl_ipmra_msg_types.h /usr/src/debug/strace/6.0-r0/src/xlat/crypto_nl_attrs.h /usr/src/debug/strace/6.0-r0/tests/fflush.c /usr/src/debug/strace/6.0-
 r0/src/xlat/ebpf_op_jmp.h /usr/src/debug/strace/6.0-r0/src/xlat/lirc_features.h /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_balance_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/adjtimex_modes.h /usr/src/debug/strace/6.0-r0/src/xlat/aio_cmds.h /usr/src/debug/strace/6.0-r0/src/xlat/btrfs_dev_replace_state.h /usr/src/debug/strace/6.0-r0/src/xlat/sigill_codes.h /usr/src/debug/strace/6.0-r0/src/xlat/schedulers.h /usr/src/debug/strace/6.0-r0/src/xlat/v4l2_capture_modes.h /usr/src/debug/strace/6.0-r0/tests/readv.c /usr/src/debug/strace/6.0-r0/tests/rmdir.c /usr/src/debug/strace/6.0-r0/src/xlat/shutdown_modes.h /usr/src/debug/strace/6.0-r0/src/xlat/ieee802154_addrs.h /usr/src/debug/strace/6.0-r0/src/xlat/fib_rule_actions.h /usr/src/debug/strace/6.0-r0/src/xlat/mmap_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/swap_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/mtd_otp_options.h /usr/src/debug/strace/6.0-r0/src/xlat/sync_file_range_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/can_protocols
 .h /usr/src/debug/strace/6.0-r0/tests/process_madvise.c /usr/src/debug/strace/6.0-r0/src/xlat/sock_rxrpc_options.h /usr/src/debug/strace/6.0-r0/src/xlat/sock_vsock_options.h /usr/src/debug/strace/6.0-r0/src/xlat/bpf_src.h /usr/src/debug/strace/6.0-r0/tests/ioctl_uffdio.c /usr/src/debug/strace/6.0-r0/src/xlat/at_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/dm_flags.h /usr/src/debug/strace/6.0-r0/src/xlat/mount_attr_propagation.h /usr/src/debug/strace/6.0-r0/src/xlat/kcmp_types.h /usr/src/debug/strace/6.0-r0/src/xlat/pkey_access.h /usr/src/debug/strace/6.0-r0/src/xlat/fib_rule_flags.h /usr/src/debug/strace/6.0-r0/tests/xetitimer.c /usr/src/debug/strace/6.0-r0/tests/redirect-fds.c", added "/usr/src/debug/strace/6.1-r0/src/xlat/rtnl_tca_act_flags.h /usr/src/debug/strace/6.1-r0/tests/epoll_pwait.c /usr/src/debug/strace/6.1-r0/src/xlat/phonet_protocols.h /usr/src/debug/strace/6.1-r0/tests/group_req.c /usr/src/debug/strace/6.1-r0/src/xlat/ifstats_attrs.h /usr/src/debug/strace/6.1-r0/src/x
 lat/tcxonc_options.h /usr/src/debug/strace/6.1-r0/src/xlat/access_modes.h /usr/src/debug/strace/6.1-r0/src/xlat/fsmount_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/evdev_ev.h /usr/src/debug/strace/6.1-r0/src/xlat/mctp_addrs.h /usr/src/debug/strace/6.1-r0/src/xlat/inet_diag_bpf_storages_attrs.h /usr/src/debug/strace/6.1-r0/tests/umovestr3.c /usr/src/debug/strace/6.1-r0/tests/status-unfinished-threads.c /usr/src/debug/strace/6.1-r0/tests/ioctl_evdev-success.c /usr/src/debug/strace/6.1-r0/src/xlat/nf_queue_msg_types.h /usr/src/debug/strace/6.1-r0/tests/netlink_generic.c /usr/src/debug/strace/6.1-r0/src/xlat/netlink_diag_show.h /usr/src/debug/strace/6.1-r0/src/xlat/move_pages_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/move_mount_flags.h /usr/src/debug/strace/6.1-r0/tests/create_tmpfile.c /usr/src/debug/strace/6.1-r0/tests/ioctl_seccomp.c /usr/src/debug/strace/6.1-r0/tests/mount_setattr.c /usr/src/debug/strace/6.1-r0/src/xlat/nf_cthelper_msg_types.h /usr/src/debug/strace/6.1-r0/src/
 xlat/ubi_data_types.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_dev_stats_values.h /usr/src/debug/strace/6.1-r0/src/xlat/kexec_load_flags.h /usr/src/debug/strace/6.1-r0/tests/seccomp-filter.c /usr/src/debug/strace/6.1-r0/tests/nfnetlink_nft_compat.c /usr/src/debug/strace/6.1-r0/tests/sched_rr_get_interval.c /usr/src/debug/strace/6.1-r0/src/xlat/bootflags1.h /usr/src/debug/strace/6.1-r0/src/xlat/bootflags2.h /usr/src/debug/strace/6.1-r0/src/xlat/bootflags3.h /usr/src/debug/strace/6.1-r0/src/xlat/quotatypes.h /usr/src/debug/strace/6.1-r0/tests/process_vm_readv_writev.c /usr/src/debug/strace/6.1-r0/tests/prctl-mce-kill.c /usr/src/debug/strace/6.1-r0/tests/seccomp-strict.c /usr/src/debug/strace/6.1-r0/tests/sigaltstack.c /usr/src/debug/strace/6.1-r0/src/xlat/keyctl_caps0.h /usr/src/debug/strace/6.1-r0/src/xlat/uring_restriction_opcodes.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_br_boolopt_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/fan_event_flags.h /usr/src/debug/strace/6.1-
 r0/src/xlat/rtnl_ifla_info_data_tun_attrs.h /usr/src/debug/strace/6.1-r0/tests/xgetrlimit.c /usr/src/debug/strace/6.1-r0/tests/riscv_flush_icache.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_neigh_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_route_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/ifstats_xstats_bridge_mcast_indices.h /usr/src/debug/strace/6.1-r0/tests/ioctl_gpio.c /usr/src/debug/strace/6.1-r0/src/xlat/ifaddrflags.h /usr/src/debug/strace/6.1-r0/src/xlat/term_oflags_crdly.h /usr/src/debug/strace/6.1-r0/src/xlat/term_oflags_ffdly.h /usr/src/debug/strace/6.1-r0/src/xlat/term_oflags_nldly.h /usr/src/debug/strace/6.1-r0/src/xlat/term_oflags_vtdly.h /usr/src/debug/strace/6.1-r0/src/xlat/tee_ioctl_optee_caps.h /usr/src/debug/strace/6.1-r0/src/xlat/term_cflags_csize.h /usr/src/debug/strace/6.1-r0/src/xlat/term_oflags_bsdly.h /usr/src/debug/strace/6.1-r0/tests/pkey_mprotect.c /usr/src/debug/strace/6.1-r0/tests/pidfd_send_signal.c /usr/src/debug/strace/6.1-r0/tests/printxval
 .c /usr/src/debug/strace/6.1-r0/tests/nlattr_rtgenmsg.c /usr/src/debug/strace/6.1-r0/src/xlat/inet6_devconf_indices.h /usr/src/debug/strace/6.1-r0/tests/fdatasync.c /usr/src/debug/strace/6.1-r0/src/xlat/inet_diag_shutdown_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/nt_descriptor_types.h /usr/src/debug/strace/6.1-r0/src/xlat/ifstats_af_spec_mpls_attrs.h /usr/src/debug/strace/6.1-r0/tests/ioctl_perf.c /usr/src/debug/strace/6.1-r0/src/xlat/term_cflags.h /usr/src/debug/strace/6.1-r0/src/xlat/term_iflags.h /usr/src/debug/strace/6.1-r0/src/xlat/term_lflags.h /usr/src/debug/strace/6.1-r0/src/xlat/term_oflags.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_control_query_flags.h /usr/src/debug/strace/6.1-r0/tests/ip_mreq.c /usr/src/debug/strace/6.1-r0/src/xlat/fib_rule_flags.h /usr/src/debug/strace/6.1-r0/tests/sigprocmask.c /usr/src/debug/strace/6.1-r0/tests/xutimes.c /usr/src/debug/strace/6.1-r0/src/xlat/qipcrtr_ports.h /usr/src/debug/strace/6.1-r0/src/xlat/nbd_ioctl_flags.h /usr/src/debug/
 strace/6.1-r0/src/xlat/rtnl_tca_stats_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/tee_ioctl_param_attr_types.h /usr/src/debug/strace/6.1-r0/tests/attach-f-p.c /usr/src/debug/strace/6.1-r0/src/xlat/hci_channels.h /usr/src/debug/strace/6.1-r0/tests/sigreturn.c /usr/src/debug/strace/6.1-r0/src/xlat/nl_xfrm_types.h /usr/src/debug/strace/6.1-r0/src/xlat/sched_flags.h /usr/src/debug/strace/6.1-r0/tests/nlattr_dcbmsg.c /usr/src/debug/strace/6.1-r0/tests/nlattr_ndtmsg.c /usr/src/debug/strace/6.1-r0/tests/nlattr_tcamsg.c /usr/src/debug/strace/6.1-r0/tests/prctl-tid_address.c /usr/src/debug/strace/6.1-r0/src/xlat/sock_raw_options.h /usr/src/debug/strace/6.1-r0/tests/nlattr_ifla_af_inet6.h /usr/src/debug/strace/6.1-r0/src/xlat/ubi_volume_flags.h /usr/src/debug/strace/6.1-r0/tests/prlimit64.c /usr/src/debug/strace/6.1-r0/tests/printstrn-umoven-undumpable.c /usr/src/debug/strace/6.1-r0/tests/time_enjoyment.h /usr/src/debug/strace/6.1-r0/src/xlat/netlink_types.h /usr/src/debug/strace/6.1-r0/src
 /xlat/fiemap_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/itimer_which.h /usr/src/debug/strace/6.1-r0/src/xlat/mremap_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_key_types.h /usr/src/debug/strace/6.1-r0/src/xlat/open_mode_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/open_tree_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_neightbl_parms_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_af_spec_mctp_attrs.h /usr/src/debug/strace/6.1-r0/tests/prctl-arg2-intptr.c /usr/src/debug/strace/6.1-r0/src/xlat/at_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/dm_flags.h /usr/src/debug/strace/6.1-r0/tests/msg_control.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_nha_res_group_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/fib_rule_actions.h /usr/src/debug/strace/6.1-r0/src/xlat/mmap_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/swap_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/dcb_commands.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_scrub_flags.h /usr/src/debug/strace/6.1-r0/s
 rc/xlat/sg_io_dxfer_direction.h /usr/src/debug/strace/6.1-r0/tests/times-fail.c /usr/src/debug/strace/6.1-r0/src/xlat/mtd_mode_options.h /usr/src/debug/strace/6.1-r0/src/xlat/mtd_type_options.h /usr/src/debug/strace/6.1-r0/src/xlat/tee_ioctl_shm_flags.h /usr/src/debug/strace/6.1-r0/tests/nlattr_inet_diag_msg.c /usr/src/debug/strace/6.1-r0/tests/nlattr_unix_diag_msg.c /usr/src/debug/strace/6.1-r0/tests/fork--pidns-translation.c /usr/src/debug/strace/6.1-r0/tests/erestartsys.c /usr/src/debug/strace/6.1-r0/src/xlat/uring_register_opcodes.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_set_vma.h /usr/src/debug/strace/6.1-r0/tests/rt_sigsuspend.c /usr/src/debug/strace/6.1-r0/src/xlat/ptp_extts_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/tcp_state_flags.h /usr/src/debug/strace/6.1-r0/tests/nlattr_netconfmsg.c /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_format_description_flags.h /usr/src/debug/strace/6.1-r0/tests/printpath-umovestr-peekdata.c /usr/src/debug/strace/6.1-r0/src/xlat/keyctl_move_
 flags.h /usr/src/debug/strace/6.1-r0/src/xlat/tls_info_versions.h /usr/src/debug/strace/6.1-r0/tests/netlink_selinux.c /usr/src/debug/strace/6.1-r0/src/xlat/uring_setup_flags.h /usr/src/debug/strace/6.1-r0/tests/getegid32.c /usr/src/debug/strace/6.1-r0/tests/geteuid32.c /usr/src/debug/strace/6.1-r0/tests/sock_filter-v.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_dev_replace_state.h /usr/src/debug/strace/6.1-r0/tests/bpf.c /usr/src/debug/strace/6.1-r0/src/xlat/uffd_api_features.h /usr/src/debug/strace/6.1-r0/tests/nfnetlink_cttimeout.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_mdba_mdb_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_map_update_elem_flags.h /usr/src/debug/strace/6.1-r0/tests/xetpriority.c /usr/src/debug/strace/6.1-r0/src/xlat/delete_module_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/memfd_create_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/adjtimex_status.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ipmra_creport_attr.h /usr/src/debug/strace/6.1-r0/tests/close_
 range.c /usr/src/debug/strace/6.1-r0/tests/prctl-spec-inject.c /usr/src/debug/strace/6.1-r0/tests/aio_pgetevents.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ipmra_msg_types.h /usr/src/debug/strace/6.1-r0/tests/quotactl.h /usr/src/debug/strace/6.1-r0/tests/old_mmap.c /usr/src/debug/strace/6.1-r0/src/xlat/mtd_otp_options.h /usr/src/debug/strace/6.1-r0/tests/quotactl.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_af_spec_inet6_attrs.h /usr/src/debug/strace/6.1-r0/tests/ioctl_ubi.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_vf_link_states.h /usr/src/debug/strace/6.1-r0/tests/print_user_desc.c /usr/src/debug/strace/6.1-r0/src/xlat/inet_diag_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/fsconfig_cmds.h /usr/src/debug/strace/6.1-r0/tests/xet_robust_list.c /usr/src/debug/strace/6.1-r0/tests/prctl-tagged-addr.c /usr/src/debug/strace/6.1-r0/src/xlat/uffd_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/routing_scopes.h /usr/src/debug/strace/6.1-r0/tests/run_expect_termsig.c /usr/src/deb
 ug/strace/6.1-r0/tests/pselect6-common.c /usr/src/debug/strace/6.1-r0/tests/xgetdents.c /usr/src/debug/strace/6.1-r0/src/xlat/advise.h /usr/src/debug/strace/6.1-r0/tests/seccomp_get_notif_sizes.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_events.h /usr/src/debug/strace/6.1-r0/tests/nfnetlink_ctnetlink_exp.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_tree_objectids.h /usr/src/debug/strace/6.1-r0/tests/getgroups.c /usr/src/debug/strace/6.1-r0/tests/setgroups.c /usr/src/debug/strace/6.1-r0/src/xlat/pr_unalign_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/ieee802154_addr_types.h /usr/src/debug/strace/6.1-r0/tests/is_linux_mips_n64.c /usr/src/debug/strace/6.1-r0/src/xlat/shutdown_modes.h /usr/src/debug/strace/6.1-r0/tests/getgid32.c /usr/src/debug/strace/6.1-r0/tests/getuid32.c /usr/src/debug/strace/6.1-r0/src/xlat/multicast_router_types.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_rxrpc_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_vsock_options.h /usr/src/debug/strace/6.1-
 r0/src/xlat/perf_type_id.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_balance_args.h /usr/src/debug/strace/6.1-r0/tests/prctl-pac-enabled-keys.c /usr/src/debug/strace/6.1-r0/src/xlat/packet_diag_show.h /usr/src/debug/strace/6.1-r0/tests/filter_seccomp-flag.c /usr/src/debug/strace/6.1-r0/src/xlat/getsock_options.h /usr/src/debug/strace/6.1-r0/src/xlat/setsock_options.h /usr/src/debug/strace/6.1-r0/src/xlat/kd_led_flags.h /usr/src/debug/strace/6.1-r0/tests/qual_fault.c /usr/src/debug/strace/6.1-r0/src/xlat/umount_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/mpol_mode_flags.h /usr/src/debug/strace/6.1-r0/tests/nlattr_mdba_router_port.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_mdba_router_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/nl_audit_types.h /usr/src/debug/strace/6.1-r0/tests/landlock_restrict_self.c /usr/src/debug/strace/6.1-r0/src/xlat/ifstats_attr_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/counter_ioctl_component_types.h /usr/src/debug/strace/6.1-r0/src/xlat/counter_i
 octl_event_types.h /usr/src/debug/strace/6.1-r0/tests/net-yy-unix.c /usr/src/debug/strace/6.1-r0/src/xlat/compat_ptrace_cmds.h /usr/src/debug/strace/6.1-r0/src/xlat/bsg_subprotocol.h /usr/src/debug/strace/6.1-r0/tests/futimesat.c /usr/src/debug/strace/6.1-r0/src/xlat/uring_iowq_acct.h /usr/src/debug/strace/6.1-r0/tests/ioctl_tee.c /usr/src/debug/strace/6.1-r0/src/xlat/kd_key_fn_key_vals.h /usr/src/debug/strace/6.1-r0/tests/oldselect-efault.c /usr/src/debug/strace/6.1-r0/tests/status-none.c /usr/src/debug/strace/6.1-r0/tests/print_maxfd.c /usr/src/debug/strace/6.1-r0/src/xlat/getrandom_flags.h /usr/src/debug/strace/6.1-r0/tests/lock_file.c /usr/src/debug/strace/6.1-r0/src/xlat/sock_nfcllcp_options.h /usr/src/debug/strace/6.1-r0/tests/quotactl_fd.c /usr/src/debug/strace/6.1-r0/tests/sockopt-sol_netlink.c /usr/src/debug/strace/6.1-r0/src/xlat/loop_flags_options.h /usr/src/debug/strace/6.1-r0/tests/kernel_old_timex.h /usr/src/debug/strace/6.1-r0/tests/epoll_ctl.c /usr/src/debug/strace/6
 .1-r0/src/xlat/cap_mask0.h /usr/src/debug/strace/6.1-r0/src/xlat/cap_mask1.h /usr/src/debug/strace/6.1-r0/src/xlat/xdp_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/perf_hw_cache_op_result_id.h /usr/src/debug/strace/6.1-r0/tests/attach-p-cmd-p.c /usr/src/debug/strace/6.1-r0/tests/kill_child.c /usr/src/debug/strace/6.1-r0/src/xlat/ebpf_op_jmp.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_fp_mode.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_colorspaces.h /usr/src/debug/strace/6.1-r0/tests/block_reset_run.c /usr/src/debug/strace/6.1-r0/src/xlat/mdb_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_file_mode_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/uffd_zeropage_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/socketlayers.h /usr/src/debug/strace/6.1-r0/tests/net-y-unix.c /usr/src/debug/strace/6.1-r0/tests/sched_get_priority_mxx.c /usr/src/debug/strace/6.1-r0/src/xlat/futexops.h /usr/src/debug/strace/6.1-r0/src/xlat/kcm_protocols.h /usr/src/debug/strace/6.1-r0/tests/attach-p-cmd-cmd.c /u
 sr/src/debug/strace/6.1-r0/tests/prctl-dumpable.c /usr/src/debug/strace/6.1-r0/src/xlat/bpf_mode.h /usr/src/debug/strace/6.1-r0/tests/ioctl_kvm_run_auxstr_vcpu.c /usr/src/debug/strace/6.1-r0/src/xlat/aio_iocb_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_addrlabel_attrs.h /usr/src/debug/strace/6.1-r0/tests/truncate64.c /usr/src/debug/strace/6.1-r0/src/xlat/uring_setup_features.h /usr/src/debug/strace/6.1-r0/src/xlat/mount_setattr_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/lirc_features.h /usr/src/debug/strace/6.1-r0/tests/readlinkat.c /usr/src/debug/strace/6.1-r0/src/xlat/tee_ioctl_origins.h /usr/src/debug/strace/6.1-r0/tests/siginfo.c /usr/src/debug/strace/6.1-r0/tests/sysinfo.c /usr/src/debug/strace/6.1-r0/src/xlat/nf_osf_msg_types.h /usr/src/debug/strace/6.1-r0/tests/nlattr_ifla_xdp.c /usr/src/debug/strace/6.1-r0/tests/ioctl_scsi.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_proto_down_reason_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/wait4_options.h /usr/src/debug
 /strace/6.1-r0/tests/skip_unavailable.c /usr/src/debug/strace/6.1-r0/src/xlat/getsock_ipv6_options.h /usr/src/debug/strace/6.1-r0/src/xlat/setsock_ipv6_options.h /usr/src/debug/strace/6.1-r0/tests/sched_xetaffinity.c /usr/src/debug/strace/6.1-r0/src/xlat/ioprio_who.h /usr/src/debug/strace/6.1-r0/src/xlat/term_line_discs.h /usr/src/debug/strace/6.1-r0/tests/personality.c /usr/src/debug/strace/6.1-r0/tests/nlattr_ifaddrmsg.c /usr/src/debug/strace/6.1-r0/tests/nlattr_ifinfomsg.c /usr/src/debug/strace/6.1-r0/tests/ioctl_v4l2.c /usr/src/debug/strace/6.1-r0/src/xlat/ip_cmsg_types.h /usr/src/debug/strace/6.1-r0/tests/epoll_wait.c /usr/src/debug/strace/6.1-r0/src/xlat/netlink_socket_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/rtc_params.h /usr/src/debug/strace/6.1-r0/src/xlat/smc_states.h /usr/src/debug/strace/6.1-r0/src/xlat/seccomp_filter_flags.h /usr/src/debug/strace/6.1-r0/tests/perf_event_open.c /usr/src/debug/strace/6.1-r0/tests/copy_file_range.c /usr/src/debug/strace/6.1-r0/tests/s
 ync_file_range.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_qgroup_inherit_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/smc_diag_mode.h /usr/src/debug/strace/6.1-r0/src/xlat/fan_init_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/fan_mark_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/loop_crypt_type_options.h /usr/src/debug/strace/6.1-r0/src/xlat/ifstats_offload_attrs.h /usr/src/debug/strace/6.1-r0/tests/sched_yield.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_info_attrs.h /usr/src/debug/strace/6.1-r0/tests/clone3.c /usr/src/debug/strace/6.1-r0/tests/filter_seccomp-perf.c /usr/src/debug/strace/6.1-r0/src/xlat/resource_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/alg_sockaddr_flags.h /usr/src/debug/strace/6.1-r0/tests/hexquote_strndup.c /usr/src/debug/strace/6.1-r0/tests/nlattr_inet_diag_req_v2.c /usr/src/debug/strace/6.1-r0/src/xlat/shm_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_br_mcast_querier_attrs.h /usr/src/debug/strace/6.1-r0/tests/getegid.c /usr/src/debug/
 strace/6.1-r0/tests/geteuid.c /usr/src/debug/strace/6.1-r0/tests/getppid.c /usr/src/debug/strace/6.1-r0/tests/getxgid.c /usr/src/debug/strace/6.1-r0/tests/tprintf.c /usr/src/debug/strace/6.1-r0/tests/getxpid.c /usr/src/debug/strace/6.1-r0/tests/getxuid.c /usr/src/debug/strace/6.1-r0/tests/setugid.c /usr/src/debug/strace/6.1-r0/src/xlat/iffflags.h /usr/src/debug/strace/6.1-r0/tests/waitpid.c /usr/src/debug/strace/6.1-r0/src/xlat/netfilter_versions.h /usr/src/debug/strace/6.1-r0/tests/ioctl_kd.c /usr/src/debug/strace/6.1-r0/src/xlat/pr_sme_vl_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_sve_vl_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/msgctl_flags.h /usr/src/debug/strace/6.1-r0/tests/arch_prctl.c /usr/src/debug/strace/6.1-r0/tests/kern_features.c /usr/src/debug/strace/6.1-r0/src/xlat/sa_handler_values.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_packet_options.h /usr/src/debug/strace/6.1-r0/tests/ioctl_lirc.c /usr/src/debug/strace/6.1-r0/tests/ioctl_ptp.c /usr/src/debug/strace
 /6.1-r0/tests/umoven-illptr.c /usr/src/debug/strace/6.1-r0/src/xlat/fiemap_extent_flags.h /usr/src/debug/strace/6.1-r0/tests/userfaultfd.c /usr/src/debug/strace/6.1-r0/src/xlat/sock_shutdown_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/netlink_protocols.h /usr/src/debug/strace/6.1-r0/tests/migrate_pages.c /usr/src/debug/strace/6.1-r0/tests/clock_t_str.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_port_attrs.h /usr/src/debug/strace/6.1-r0/tests/count-f.c /usr/src/debug/strace/6.1-r0/tests/vfork-f.c /usr/src/debug/strace/6.1-r0/src/xlat/ioctl_dirs.h /usr/src/debug/strace/6.1-r0/tests/segv_pkuerr.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_dcb_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_mdb_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_buf_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_vbi_flags.h /usr/src/debug/strace/6.1-r0/tests/netlink_protocol.c /usr/src/debug/strace/6.1-r0/tests/xselect.c /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_control_id_bases.h /usr/src
 /debug/strace/6.1-r0/src/xlat/rtnl_mdba_router_pattr_attrs.h /usr/src/debug/strace/6.1-r0/tests/set_ptracer_any.c /usr/src/debug/strace/6.1-r0/src/xlat/bpf_test_run_flags.h /usr/src/debug/strace/6.1-r0/tests/printstr.c /usr/src/debug/strace/6.1-r0/tests/rt_sigtimedwait.c /usr/src/debug/strace/6.1-r0/tests/umovestr.c /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_frameinterval_types.h /usr/src/debug/strace/6.1-r0/tests/setdomainname.c /usr/src/debug/strace/6.1-r0/tests/access.c /usr/src/debug/strace/6.1-r0/tests/ioctl_sock_gifconf.c /usr/src/debug/strace/6.1-r0/src/xlat/memfd_secret_flags.h /usr/src/debug/strace/6.1-r0/tests/status.c /usr/src/debug/strace/6.1-r0/src/xlat/nf_ipset_msg_types.h /usr/src/debug/strace/6.1-r0/tests/nlattr_nlmsgerr.c /usr/src/debug/strace/6.1-r0/tests/fchownat--secontext.c /usr/src/debug/strace/6.1-r0/tests/hexdump_strdup.c /usr/src/debug/strace/6.1-r0/src/xlat/hw_breakpoint_len.h /usr/src/debug/strace/6.1-r0/tests/preadv-pwritev.c /usr/src/debug/strace/6.1-r0/
 src/xlat/adjtimex_state.h /usr/src/debug/strace/6.1-r0/src/xlat/qipcrtr_nodes.h /usr/src/debug/strace/6.1-r0/tests/ioctl_kvm_run.c /usr/src/debug/strace/6.1-r0/tests/execveat.c /usr/src/debug/strace/6.1-r0/tests/renameat.c /usr/src/debug/strace/6.1-r0/src/xlat/cap.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_prog_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/nfc_protocols.h /usr/src/debug/strace/6.1-r0/src/xlat/smc_protocols.h /usr/src/debug/strace/6.1-r0/tests/fsconfig.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_mdba_mdb_entry_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/crypto_nl_attrs.h /usr/src/debug/strace/6.1-r0/tests/pidfd_getfd.c /usr/src/debug/strace/6.1-r0/src/xlat/perf_event_read_format.h /usr/src/debug/strace/6.1-r0/tests/prctl-set_vma.c /usr/src/debug/strace/6.1-r0/tests/xattr-strings.c /usr/src/debug/strace/6.1-r0/tests/readdir.c /usr/src/debug/strace/6.1-r0/src/xlat/routing_table_ids.h /usr/src/debug/strace/6.1-r0/src/xlat/mtd_file_mode_options.h /usr/src/debug/strac
 e/6.1-r0/tests/munlockall.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_vf_info_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_vf_port_attrs.h /usr/src/debug/strace/6.1-r0/tests/netlink_netlink_diag.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_neightbl_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_tuner_audmodes.h /usr/src/debug/strace/6.1-r0/tests/nfnetlink_ipset.c /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_pix_fmts.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_sdr_fmts.h /usr/src/debug/strace/6.1-r0/tests/chmod--secontext.c /usr/src/debug/strace/6.1-r0/src/xlat/icmp_filter_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/sigact_flags.h /usr/src/debug/strace/6.1-r0/tests/symlink.c /usr/src/debug/strace/6.1-r0/tests/trie_test.c /usr/src/debug/strace/6.1-r0/src/xlat/madvise_cmds.h /usr/src/debug/strace/6.1-r0/tests/so_peercred.c /usr/src/debug/strace/6.1-r0/src/xlat/open_resolve_flags.h /usr/src/debug/strace/6.1-r0/tests/perf_event_open_nonverbose.c /usr/src/debug/strac
 e/6.1-r0/tests/nlattr_packet_diag_msg.c /usr/src/debug/strace/6.1-r0/tests/nlattr_ifla_brport.c /usr/src/debug/strace/6.1-r0/src/xlat/inet_diag_ulp_info_tls_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/mptcp_subflow_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_vf_vlan_list_attrs.h /usr/src/debug/strace/6.1-r0/tests/fsync-y.c /usr/src/debug/strace/6.1-r0/tests/inotify_init.c /usr/src/debug/strace/6.1-r0/src/xlat/bluetooth_l2_cid.h /usr/src/debug/strace/6.1-r0/tests/newfstatat.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_tc_action_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_features_compat.h /usr/src/debug/strace/6.1-r0/tests/ioctl_sock.c /usr/src/debug/strace/6.1-r0/tests/sendfile64.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_xdp_attrs.h /usr/src/debug/strace/6.1-r0/tests/clock_xettime-common.c /usr/src/debug/strace/6.1-r0/src/xlat/uffd_api_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/kd_key_lock_keys.h /usr/src/debug/strace/6.1-r0/src/xlat/clone3_flags.h /
 usr/src/debug/strace/6.1-r0/tests/execve.c /usr/src/debug/strace/6.1-r0/tests/ptrace.c /usr/src/debug/strace/6.1-r0/tests/rename.c /usr/src/debug/strace/6.1-r0/tests/splice.c /usr/src/debug/strace/6.1-r0/src/xlat/sigill_codes.h /usr/src/debug/strace/6.1-r0/tests/nfnetlink_nftables.c /usr/src/debug/strace/6.1-r0/tests/nlattr_ifla_port.c /usr/src/debug/strace/6.1-r0/src/xlat/x86_xfeatures.h /usr/src/debug/strace/6.1-r0/tests/syslog.c /usr/src/debug/strace/6.1-r0/src/xlat/nl_route_types.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_af_spec_bridge_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_rta_metrics_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/lwtunnel_encap_types.h /usr/src/debug/strace/6.1-r0/tests/status-successful.c /usr/src/debug/strace/6.1-r0/src/xlat/ipccalls.h /usr/src/debug/strace/6.1-r0/tests/getdents.c /usr/src/debug/strace/6.1-r0/src/xlat/mlock_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/vsock_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/vsock_ports.h /usr/
 src/debug/strace/6.1-r0/tests/landlock_create_ruleset.c /usr/src/debug/strace/6.1-r0/tests/printstrn-umoven-peekdata.c /usr/src/debug/strace/6.1-r0/tests/openat2.c /usr/src/debug/strace/6.1-r0/tests/umount2.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_send_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/perf_ioctl_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_fields.h /usr/src/debug/strace/6.1-r0/src/xlat/mtd_nandecc_options.h /usr/src/debug/strace/6.1-r0/tests/so_linger.c /usr/src/debug/strace/6.1-r0/src/xlat/ethernet_protocols.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_pac_keys.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_features_incompat.h /usr/src/debug/strace/6.1-r0/src/xlat/kcmp_types.h /usr/src/debug/strace/6.1-r0/tests/sprintrc.c /usr/src/debug/strace/6.1-r0/src/xlat/term_oflags_tabdly.h /usr/src/debug/strace/6.1-r0/src/xlat/fan_classes.h /usr/src/debug/strace/6.1-r0/src/xlat/neighbor_cache_entry_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/sigaltstack_flags.h /usr/sr
 c/debug/strace/6.1-r0/tests/semop-indirect.c /usr/src/debug/strace/6.1-r0/src/xlat/ubi_volume_props.h /usr/src/debug/strace/6.1-r0/src/xlat/sigev_value.h /usr/src/debug/strace/6.1-r0/src/xlat/uring_sqe_flags.h /usr/src/debug/strace/6.1-r0/tests/ioctl_sg_io_v3.c /usr/src/debug/strace/6.1-r0/tests/recv-MSG_TRUNC.c /usr/src/debug/strace/6.1-r0/src/xlat/pr_spec_get_store_bypass_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_spec_set_store_bypass_flags.h /usr/src/debug/strace/6.1-r0/tests/clock_adjtime-common.c /usr/src/debug/strace/6.1-r0/src/xlat/nf_ulog_msg_types.h /usr/src/debug/strace/6.1-r0/tests/nlattr_ifla.h /usr/src/debug/strace/6.1-r0/tests/nlattr_inet_diag_req_compat.c /usr/src/debug/strace/6.1-r0/src/xlat/evdev_ff_status.h /usr/src/debug/strace/6.1-r0/src/xlat/shm_resource_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/pidfd_open_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/sigfpe_codes.h /usr/src/debug/strace/6.1-r0/src/xlat/xdp_sockaddr_flags.h /usr/src/debug/strace/6.1-r
 0/tests/inode_of_sockfd.c /usr/src/debug/strace/6.1-r0/tests/net-packet_mreq.c /usr/src/debug/strace/6.1-r0/src/xlat/bpf_size.h /usr/src/debug/strace/6.1-r0/tests/ioctl_hdio.c /usr/src/debug/strace/6.1-r0/src/xlat/tls_info_ciphers.h /usr/src/debug/strace/6.1-r0/src/xlat/inet_devconf_indices.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_bluetooth_options.h /usr/src/debug/strace/6.1-r0/tests/prctl-seccomp-filter-v.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_tca_act_hw_stats.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_dev_stats_flags.h /usr/src/debug/strace/6.1-r0/tests/clone_parent.c /usr/src/debug/strace/6.1-r0/tests/clone_ptrace.c /usr/src/debug/strace/6.1-r0/tests/epoll_pwait2.c /usr/src/debug/strace/6.1-r0/src/xlat/keyctl_caps1.h /usr/src/debug/strace/6.1-r0/src/xlat/membarrier_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/mount_flags.h /usr/src/debug/strace/6.1-r0/tests/sched_xetparam.c /usr/src/debug/strace/6.1-r0/src/xlat/quota_formats.h /usr/src/debug/strace/6.1-r0/src/xlat/
 v4l2_tuner_rxsubchanses.h /usr/src/debug/strace/6.1-r0/tests/semtimedop-syscall.c /usr/src/debug/strace/6.1-r0/tests/read-write.c /usr/src/debug/strace/6.1-r0/src/xlat/nfc_saps.h /usr/src/debug/strace/6.1-r0/src/xlat/clockflags.h /usr/src/debug/strace/6.1-r0/src/xlat/clocknames.h /usr/src/debug/strace/6.1-r0/src/xlat/vsock_cids.h /usr/src/debug/strace/6.1-r0/src/xlat/sigsegv_codes.h /usr/src/debug/strace/6.1-r0/tests/net-yy-netlink.c /usr/src/debug/strace/6.1-r0/tests/modify_ldt.c /usr/src/debug/strace/6.1-r0/tests/fchmod-y--secontext.c /usr/src/debug/strace/6.1-r0/tests/mincore.c /usr/src/debug/strace/6.1-r0/tests/unshare.c /usr/src/debug/strace/6.1-r0/tests/ioctl_nbd.c /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_memories.h /usr/src/debug/strace/6.1-r0/tests/qual_inject-error-signal.c /usr/src/debug/strace/6.1-r0/tests/nlattr_tca_stab.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_neigh_fdb_ext_attrs.h /usr/src/debug/strace/6.1-r0/tests/fchmod--secontext.c /usr/src/debug/strace/6.1-r0
 /src/xlat/in6_addr_gen_mode.h /usr/src/debug/strace/6.1-r0/tests/net-sockaddr.c /usr/src/debug/strace/6.1-r0/tests/socketcall.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ip6mra_msg_types.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_sliced_flags.h /usr/src/debug/strace/6.1-r0/tests/maybe_switch_current_tcp.c /usr/src/debug/strace/6.1-r0/tests/process_mrelease.c /usr/src/debug/strace/6.1-r0/src/xlat/inet6_if_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_buf_flags_ts_type.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_space_info_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/netlink_states.h /usr/src/debug/strace/6.1-r0/tests/prctl-sched-core.c /usr/src/debug/strace/6.1-r0/tests/signal2name.c /usr/src/debug/strace/6.1-r0/tests/nlattr_ifla_protinfo.c /usr/src/debug/strace/6.1-r0/src/xlat/packet_diag_info_flags.h /usr/src/debug/strace/6.1-r0/tests/error_msg.c /usr/src/debug/strace/6.1-r0/tests/io_uring_register.c /usr/src/debug/strace/6.1-r0/src/xlat/evdev_autorepeat.h /usr/src/debug
 /strace/6.1-r0/tests/prctl-cap-ambient.c /usr/src/debug/strace/6.1-r0/tests/vhangup.c /usr/src/debug/strace/6.1-r0/tests/nanosleep.c /usr/src/debug/strace/6.1-r0/tests/adjtimex.c /usr/src/debug/strace/6.1-r0/tests/sched_xetscheduler.c /usr/src/debug/strace/6.1-r0/src/xlat/kd_key_brl_keys.h /usr/src/debug/strace/6.1-r0/src/xlat/kd_key_cur_keys.h /usr/src/debug/strace/6.1-r0/src/xlat/kd_key_pad_keys.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_capture_modes.h /usr/src/debug/strace/6.1-r0/tests/nfnetlink_osf.c /usr/src/debug/strace/6.1-r0/src/xlat/smc_link_group_roles.h /usr/src/debug/strace/6.1-r0/tests/symlinkat.c /usr/src/debug/strace/6.1-r0/tests/nfnetlink_cthelper.c /usr/src/debug/strace/6.1-r0/tests/rt_sigreturn.c /usr/src/debug/strace/6.1-r0/tests/ioctl_fs_x.c /usr/src/debug/strace/6.1-r0/src/xlat/evdev_leds.h /usr/src/debug/strace/6.1-r0/src/xlat/evdev_misc.h /usr/src/debug/strace/6.1-r0/src/xlat/evdev_prop.h /usr/src/debug/strace/6.1-r0/src/xlat/sg_io_info.h /usr/src/debug/str
 ace/6.1-r0/src/xlat/bluetooth_l2_psm.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_defrag_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/tls_info_configs.h /usr/src/debug/strace/6.1-r0/src/xlat/blkpg_ops.h /usr/src/debug/strace/6.1-r0/tests/setrlimit.c /usr/src/debug/strace/6.1-r0/src/xlat/tee_ioctl_max_arg_size.h /usr/src/debug/strace/6.1-r0/tests/umovestr_cached.c /usr/src/debug/strace/6.1-r0/src/xlat/netlink_get_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/landlock_ruleset_access_fs.h /usr/src/debug/strace/6.1-r0/src/xlat/syslog_action_type.h /usr/src/debug/strace/6.1-r0/src/xlat/sg_io_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/uring_files_update_fds.h /usr/src/debug/strace/6.1-r0/tests/move_mount.c /usr/src/debug/strace/6.1-r0/src/xlat/netlink_delete_flags.h /usr/src/debug/strace/6.1-r0/tests/getsockname--secontext.c /usr/src/debug/strace/6.1-r0/tests/printsignal.c /usr/src/debug/strace/6.1-r0/tests/qual_signal.c /usr/src/debug/strace/6.1-r0/src/xlat/landlock_create_ruleset_f
 lags.h /usr/src/debug/strace/6.1-r0/tests/nlattr_tc_stats.c /usr/src/debug/strace/6.1-r0/tests/request_key.c /usr/src/debug/strace/6.1-r0/src/xlat/bpf_attach_type.h /usr/src/debug/strace/6.1-r0/tests/printpath-umovestr-undumpable.c /usr/src/debug/strace/6.1-r0/tests/open.c /usr/src/debug/strace/6.1-r0/tests/pipe.c /usr/src/debug/strace/6.1-r0/tests/poke.c /usr/src/debug/strace/6.1-r0/tests/poll.c /usr/src/debug/strace/6.1-r0/tests/swap.c /usr/src/debug/strace/6.1-r0/tests/sync.c /usr/src/debug/strace/6.1-r0/tests/link.c /usr/src/debug/strace/6.1-r0/tests/mmap.c /usr/src/debug/strace/6.1-r0/tests/mmsg.c /usr/src/debug/strace/6.1-r0/tests/acct.c /usr/src/debug/strace/6.1-r0/tests/int_0x80.c /usr/src/debug/strace/6.1-r0/src/xlat/fdflags.h /usr/src/debug/strace/6.1-r0/src/xlat/neighbor_cache_entry_states.h /usr/src/debug/strace/6.1-r0/src/xlat/schedulers.h /usr/src/debug/strace/6.1-r0/tests/test_ucopy.c /usr/src/debug/strace/6.1-r0/tests/so_error.c /usr/src/debug/strace/6.1-r0/src/xlat/
 timerfdflags.h /usr/src/debug/strace/6.1-r0/tests/test_ucopy.h /usr/src/debug/strace/6.1-r0/tests/landlock_add_rule.c /usr/src/debug/strace/6.1-r0/src/xlat/inotify_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/adjtimex_modes.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_map_types.h /usr/src/debug/strace/6.1-r0/tests/aio.c /usr/src/debug/strace/6.1-r0/tests/nlattr_ifla_af_spec.c /usr/src/debug/strace/6.1-r0/tests/check_sigign.c /usr/src/debug/strace/6.1-r0/tests/memfd_secret.c /usr/src/debug/strace/6.1-r0/src/xlat/bt_protocols.h /usr/src/debug/strace/6.1-r0/tests/seccomp_get_action_avail.c /usr/src/debug/strace/6.1-r0/src/xlat/priorities.h /usr/src/debug/strace/6.1-r0/src/xlat/get_mempolicy_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_control_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_control_types.h /usr/src/debug/strace/6.1-r0/src/xlat/kd_kbd_modes.h /usr/src/debug/strace/6.1-r0/src/xlat/kd_kbd_types.h /usr/src/debug/strace/6.1-r0/src/xlat/kd_key_types.h /usr/src/debug/
 strace/6.1-r0/src/xlat/bsg_protocol.h /usr/src/debug/strace/6.1-r0/src/xlat/semop_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_sctp_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_tipc_options.h /usr/src/debug/strace/6.1-r0/tests/getdents64.c /usr/src/debug/strace/6.1-r0/tests/access--secontext.c /usr/src/debug/strace/6.1-r0/tests/sigsuspend.c /usr/src/debug/strace/6.1-r0/src/xlat/sock_rds_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_tcp_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_tls_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_udp_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_xdp_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_alg_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_ipx_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_kcm_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_llc_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_pnp_options.h /usr/src/debug/strace/6.1-r0/tests/prctl-seccomp-strict.c /usr/src/deb
 ug/strace/6.1-r0/src/xlat/sigbus_codes.h /usr/src/debug/strace/6.1-r0/src/xlat/kd_key_dead_keys.h /usr/src/debug/strace/6.1-r0/src/xlat/perf_event_sample_format.h /usr/src/debug/strace/6.1-r0/tests/net-tpacket_req.c /usr/src/debug/strace/6.1-r0/tests/fadvise64.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_features_compat_ro.h /usr/src/debug/strace/6.1-r0/tests/prctl-sme.c /usr/src/debug/strace/6.1-r0/tests/signal_receive.c /usr/src/debug/strace/6.1-r0/src/xlat/inet_diag_bpf_storage_attrs.h /usr/src/debug/strace/6.1-r0/tests/nlattr_mdba_mdb_entry.c /usr/src/debug/strace/6.1-r0/src/xlat/pr_sud_cmds.h /usr/src/debug/strace/6.1-r0/src/xlat/kd_keymap_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/gpio_handle_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/netlink_new_flags.h /usr/src/debug/strace/6.1-r0/tests/move_pages.c /usr/src/debug/strace/6.1-r0/src/xlat/inet_diag_extended_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/nl_sock_diag_types.h /usr/src/debug/strace/6.1-r0/src/xlat/tee_ioctl
 _gen_caps.h /usr/src/debug/strace/6.1-r0/src/xlat/perf_branch_sample_type.h /usr/src/debug/strace/6.1-r0/tests/sched_xetattr.c /usr/src/debug/strace/6.1-r0/tests/timer_xettime.c /usr/src/debug/strace/6.1-r0/src/xlat/at_statx_sync_types.h /usr/src/debug/strace/6.1-r0/src/xlat/fsmount_attr_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_options.h /usr/src/debug/strace/6.1-r0/src/xlat/ax25_protocols.h /usr/src/debug/strace/6.1-r0/tests/pwritev.c /usr/src/debug/strace/6.1-r0/tests/fchownat.c /usr/src/debug/strace/6.1-r0/tests/ifindex.c /usr/src/debug/strace/6.1-r0/src/xlat/netlink_ack_flags.h /usr/src/debug/strace/6.1-r0/tests/rt_tgsigqueueinfo.c /usr/src/debug/strace/6.1-r0/src/xlat/sock_netlink_options.h /usr/src/debug/strace/6.1-r0/tests/clone-flags.c /usr/src/debug/strace/6.1-r0/src/xlat/splice_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/mctl_sync.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_dumpable.h /usr/src/debug/strace/6.1-r0/src/xlat/mtd_flags_options.h /usr/src/debug/strac
 e/6.1-r0/src/xlat/tee_ioctl_impl_ids.h /usr/src/debug/strace/6.1-r0/src/xlat/sigsys_codes.h /usr/src/debug/strace/6.1-r0/tests/s390_pci_mmio_read_write.c /usr/src/debug/strace/6.1-r0/tests/sigpending.c /usr/src/debug/strace/6.1-r0/tests/ipc_msg.c /usr/src/debug/strace/6.1-r0/tests/libmmsg.c /usr/src/debug/strace/6.1-r0/tests/recvmsg.c /usr/src/debug/strace/6.1-r0/src/xlat/semctl_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/shmctl_flags.h /usr/src/debug/strace/6.1-r0/tests/madvise.c /usr/src/debug/strace/6.1-r0/tests/fadvise.h /usr/src/debug/strace/6.1-r0/tests/dev-yy.c /usr/src/debug/strace/6.1-r0/src/xlat/seccomp_ioctl_resp_flags.h /usr/src/debug/strace/6.1-r0/tests/semtimedop.c /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_buf_types.h /usr/src/debug/strace/6.1-r0/tests/execveat--secontext.c /usr/src/debug/strace/6.1-r0/src/xlat/tee_ioctl_login_types.h /usr/src/debug/strace/6.1-r0/src/xlat/kvm_mem_flags.h /usr/src/debug/strace/6.1-r0/tests/overflowuid.c /usr/src/debug/strace/6.1-r0/t
 ests/printflags.c /usr/src/debug/strace/6.1-r0/src/xlat/af_packet_types.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_addr_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_link_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_nsid_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_rule_attrs.h /usr/src/debug/strace/6.1-r0/tests/segv_accerr.c /usr/src/debug/strace/6.1-r0/tests/getcpu.c /usr/src/debug/strace/6.1-r0/tests/epoll_create1.c /usr/src/debug/strace/6.1-r0/tests/ioctl_counter.c /usr/src/debug/strace/6.1-r0/src/xlat/addrfams.h /usr/src/debug/strace/6.1-r0/src/xlat/ifstats_xstats_bridge_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_snap_flags_v2.h /usr/src/debug/strace/6.1-r0/tests/test_nlattr.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_task_fd_type.h /usr/src/debug/strace/6.1-r0/src/xlat/membarrier_cmds.h /usr/src/debug/strace/6.1-r0/tests/inotify.c /usr/src/debug/strace/6.1-r0/tests/orphaned_process_group.c /usr/src/debug/strace/6.1-r0/tests/readv.c /usr/src/debug/st
 race/6.1-r0/src/xlat/rtnl_ifla_info_data_bridge_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/sigprocmaskcmds.h /usr/src/debug/strace/6.1-r0/src/xlat/nf_nft_compat_msg_types.h /usr/src/debug/strace/6.1-r0/src/xlat/futex_waiter_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/ebpf_op_alu.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_tsc.h /usr/src/debug/strace/6.1-r0/src/xlat/flockcmds.h /usr/src/debug/strace/6.1-r0/src/xlat/netlink_diag_attrs.h /usr/src/debug/strace/6.1-r0/tests/attach-p-cmd.h /usr/src/debug/strace/6.1-r0/src/xlat/statx_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/statx_masks.h /usr/src/debug/strace/6.1-r0/src/xlat/epollevents.h /usr/src/debug/strace/6.1-r0/src/xlat/key_reqkeys.h /usr/src/debug/strace/6.1-r0/src/xlat/numa_node.h /usr/src/debug/strace/6.1-r0/tests/fspick.c /usr/src/debug/strace/6.1-r0/tests/llseek.c /usr/src/debug/strace/6.1-r0/tests/unlink.c /usr/src/debug/strace/6.1-r0/tests/ioperm.c /usr/src/debug/strace/6.1-r0/tests/set_sigblock.c /usr/src/debug/strac
 e/6.1-r0/src/xlat/ptrace_peeksiginfo_flags.h /usr/src/debug/strace/6.1-r0/tests/ioctl_random.c /usr/src/debug/strace/6.1-r0/src/xlat/kexec_arch_values.h /usr/src/debug/strace/6.1-r0/src/xlat/open_access_modes.h /usr/src/debug/strace/6.1-r0/tests/zeroargc.c /usr/src/debug/strace/6.1-r0/tests/mlock2.c /usr/src/debug/strace/6.1-r0/tests/nlattr_ifla_vfinfo.c /usr/src/debug/strace/6.1-r0/tests/unix-pair-send-recv.c /usr/src/debug/strace/6.1-r0/tests/brk.c /usr/src/debug/strace/6.1-r0/tests/netlink_xfrm.c /usr/src/debug/strace/6.1-r0/src/xlat/pr_mce_kill_policy.h /usr/src/debug/strace/6.1-r0/tests/strace--decode-pids-comm.c /usr/src/debug/strace/6.1-r0/tests/umode_t.c /usr/src/debug/strace/6.1-r0/tests/ioprio.c /usr/src/debug/strace/6.1-r0/src/xlat/gpio_event_flags.h /usr/src/debug/strace/6.1-r0/tests/nlattr_br_port_msg.c /usr/src/debug/strace/6.1-r0/src/xlat/af_packet_versions.h /usr/src/debug/strace/6.1-r0/tests/quotactl-xfs.c /usr/src/debug/strace/6.1-r0/src/xlat/syslog_console_levels.
 h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_map_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/mlockall_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/kd_modes.h /usr/src/debug/strace/6.1-r0/tests/truncate.c /usr/src/debug/strace/6.1-r0/tests/libsocketcall.c /usr/src/debug/strace/6.1-r0/tests/nfnetlink_queue.c /usr/src/debug/strace/6.1-r0/src/xlat/perf_hw_cache_id.h /usr/src/debug/strace/6.1-r0/tests/fanotify_mark--secontext.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_bridge_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/nl_selinux_types.h /usr/src/debug/strace/6.1-r0/src/xlat/close_range_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/rxrpc_services.h /usr/src/debug/strace/6.1-r0/src/xlat/smc_decl_codes.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_sched_core_pidtypes.h /usr/src/debug/strace/6.1-r0/tests/eventfd.c /usr/src/debug/strace/6.1-r0/src/xlat/ebpf_class.h /usr/src/debug/strace/6.1-r0/src/xlat/ifstats_xstats_bond_3ad_attrs.h /usr/src/debug/strace/6.1-r0/tests/lookup_dcookie.c
  /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_tc_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_tagged_addr_enable.h /usr/src/debug/strace/6.1-r0/tests/vmsplice.c /usr/src/debug/strace/6.1-r0/src/xlat/sigtrap_codes.h /usr/src/debug/strace/6.1-r0/tests/looping_threads.c /usr/src/debug/strace/6.1-r0/tests/shutdown.c /usr/src/debug/strace/6.1-r0/tests/prctl-syscall-user-dispatch.c /usr/src/debug/strace/6.1-r0/src/xlat/perf_hw_id.h /usr/src/debug/strace/6.1-r0/tests/rt_sigprocmask.c /usr/src/debug/strace/6.1-r0/src/xlat/socketcalls.h /usr/src/debug/strace/6.1-r0/tests/getpeername.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_fs_info_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/aio_cmds.h /usr/src/debug/strace/6.1-r0/tests/prctl-unalign.c /usr/src/debug/strace/6.1-r0/src/xlat/bpf_op_alu.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_op_jmp.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_miscop.h /usr/src/debug/strace/6.1-r0/tests/ioctl_evdev.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_qgroup
 _ctl_cmds.h /usr/src/debug/strace/6.1-r0/tests/getresugid.c /usr/src/debug/strace/6.1-r0/tests/setresugid.c /usr/src/debug/strace/6.1-r0/tests/status-failed.c /usr/src/debug/strace/6.1-r0/tests/status-none-f.c /usr/src/debug/strace/6.1-r0/src/xlat/bpf_link_create_kprobe_multi_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_qgroup_status_flags.h /usr/src/debug/strace/6.1-r0/tests/fcntl64.c /usr/src/debug/strace/6.1-r0/src/xlat/mount_attr_attr.h /usr/src/debug/strace/6.1-r0/tests/inotify_init1.c /usr/src/debug/strace/6.1-r0/tests/kernel_version.c /usr/src/debug/strace/6.1-r0/src/xlat/kd_meta_vals.h /usr/src/debug/strace/6.1-r0/tests/inet-cmsg.c /usr/src/debug/strace/6.1-r0/tests/osf_utimes.c /usr/src/debug/strace/6.1-r0/tests/ioctl_termios.c /usr/src/debug/strace/6.1-r0/tests/mlockall.c /usr/src/debug/strace/6.1-r0/tests/ioctl_perf-success.c /usr/src/debug/strace/6.1-r0/src/xlat/tcp_states.h /usr/src/debug/strace/6.1-r0/tests/sendfile.c /usr/src/debug/strace/6.1-r0/src/xlat/kd_fon
 t_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_vfinfo_list_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/mctp_nets.h /usr/src/debug/strace/6.1-r0/tests/threads-execve.c /usr/src/debug/strace/6.1-r0/tests/rt_sigaction.c /usr/src/debug/strace/6.1-r0/src/xlat/rename_flags.h /usr/src/debug/strace/6.1-r0/tests/caps.c /usr/src/debug/strace/6.1-r0/tests/dup2.c /usr/src/debug/strace/6.1-r0/tests/dup3.c /usr/src/debug/strace/6.1-r0/tests/iopl.c /usr/src/debug/strace/6.1-r0/tests/kcmp.c /usr/src/debug/strace/6.1-r0/tests/s390_sthyi.c /usr/src/debug/strace/6.1-r0/tests/kill.c /usr/src/debug/strace/6.1-r0/tests/time.c /usr/src/debug/strace/6.1-r0/tests/prctl-securebits.c /usr/src/debug/strace/6.1-r0/src/xlat/hw_breakpoint_type.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_csum_types.h /usr/src/debug/strace/6.1-r0/src/xlat/kd_key_slock_keys.h /usr/src/debug/strace/6.1-r0/tests/create_nl_socket.c /usr/src/debug/strace/6.1-r0/src/xlat/counter_ioctl_scopes.h /usr/src/debug/strace/6.1-r0/
 tests/printpath-umovestr.c /usr/src/debug/strace/6.1-r0/tests/umovestr-illptr.c /usr/src/debug/strace/6.1-r0/tests/xchownx.c /usr/src/debug/strace/6.1-r0/tests/timerfd_xettime.c /usr/src/debug/strace/6.1-r0/tests/status-unfinished.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_compress_types.h /usr/src/debug/strace/6.1-r0/tests/redirect-fds.c /usr/src/debug/strace/6.1-r0/tests/finit_module.c /usr/src/debug/strace/6.1-r0/src/xlat/can_protocols.h /usr/src/debug/strace/6.1-r0/tests/prctl_marker.c /usr/src/debug/strace/6.1-r0/src/xlat/evdev_relative_axes.h /usr/src/debug/strace/6.1-r0/src/xlat/key_perms.h /usr/src/debug/strace/6.1-r0/tests/prctl-tsc.c /usr/src/debug/strace/6.1-r0/tests/xettimeofday.c /usr/src/debug/strace/6.1-r0/tests/fork-f.c /usr/src/debug/strace/6.1-r0/tests/pc.c /usr/src/debug/strace/6.1-r0/tests/fflush.c /usr/src/debug/strace/6.1-r0/src/xlat/keyctl_pkey_ops.h /usr/src/debug/strace/6.1-r0/tests/test_printpath.c /usr/src/debug/strace/6.1-r0/tests/filter-unavailable.c 
 /usr/src/debug/strace/6.1-r0/tests/netlink_crypto.c /usr/src/debug/strace/6.1-r0/tests/answer.c /usr/src/debug/strace/6.1-r0/tests/fchdir.c /usr/src/debug/strace/6.1-r0/tests/nlattr.c /usr/src/debug/strace/6.1-r0/tests/subdir.c /usr/src/debug/strace/6.1-r0/tests/prctl-pdeathsig.c /usr/src/debug/strace/6.1-r0/tests/xattr.c /usr/src/debug/strace/6.1-r0/tests/accept.c /usr/src/debug/strace/6.1-r0/tests/chroot.c /usr/src/debug/strace/6.1-r0/tests/linkat.c /usr/src/debug/strace/6.1-r0/tests/openat.c /usr/src/debug/strace/6.1-r0/tests/reboot.c /usr/src/debug/strace/6.1-r0/tests/select.c /usr/src/debug/strace/6.1-r0/tests/test_printstrn.c /usr/src/debug/strace/6.1-r0/tests/umount.c /usr/src/debug/strace/6.1-r0/tests/get_mempolicy.c /usr/src/debug/strace/6.1-r0/tests/set_mempolicy.c /usr/src/debug/strace/6.1-r0/tests/strace-p1-Y-p.c /usr/src/debug/strace/6.1-r0/tests/printstrn-umoven.c /usr/src/debug/strace/6.1-r0/tests/list_sigaction_signum.c /usr/src/debug/strace/6.1-r0/src/xlat/route_nex
 thop_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/uring_register_rsrc_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/f_owner_types.h /usr/src/debug/strace/6.1-r0/src/xlat/ifstats_xstats_bond_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/inotify_init_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/ptrace_setoptions_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_rval.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_ip_options.h /usr/src/debug/strace/6.1-r0/src/xlat/mmap_prot.h /usr/src/debug/strace/6.1-r0/tests/set_mempolicy_home_node.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_brport_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/if_dqinfo_valid.h /usr/src/debug/strace/6.1-r0/tests/kernel_old_timespec.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_family.h /usr/src/debug/strace/6.1-r0/src/xlat/nl_crypto_types.h /usr/src/debug/strace/6.1-r0/src/xlat/smc_diag_attrs.h /usr/src/debug/strace/6.1-r0/tests/nfnetlink_ulog.c /usr/src/debug/strace/6.1-r0/tests/xet_thread_area_x86.c /usr/src/de
 bug/strace/6.1-r0/tests/status-none-threads.c /usr/src/debug/strace/6.1-r0/tests/recvfrom-MSG_TRUNC.c /usr/src/debug/strace/6.1-r0/src/xlat/sock_type_flags.h /usr/src/debug/strace/6.1-r0/tests/qual_inject-retval.c /usr/src/debug/strace/6.1-r0/tests/ioctl_fiemap.c /usr/src/debug/strace/6.1-r0/src/xlat/modetypes.h /usr/src/debug/strace/6.1-r0/src/xlat/evdev_abs.h /usr/src/debug/strace/6.1-r0/src/xlat/evdev_snd.h /usr/src/debug/strace/6.1-r0/tests/nlattr_ndmsg.c /usr/src/debug/strace/6.1-r0/tests/nlattr_nhmsg.c /usr/src/debug/strace/6.1-r0/tests/nlattr_rtmsg.c /usr/src/debug/strace/6.1-r0/tests/nlattr_tcmsg.c /usr/src/debug/strace/6.1-r0/src/xlat/kd_default_led_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/hdio_busstates.h /usr/src/debug/strace/6.1-r0/src/xlat/ptrace_cmds.h /usr/src/debug/strace/6.1-r0/src/xlat/evdev_switch.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_dev_replace_cmds.h /usr/src/debug/strace/6.1-r0/tests/pkey_alloc.c /usr/src/debug/strace/6.1-r0/tests/tail_alloc.c /us
 r/src/debug/strace/6.1-r0/tests/print_time.c /usr/src/debug/strace/6.1-r0/src/xlat/gpio_line_flags.h /usr/src/debug/strace/6.1-r0/tests/nlattr_netlink_diag_msg.c /usr/src/debug/strace/6.1-r0/tests/uio.c /usr/src/debug/strace/6.1-r0/src/xlat/tun_device_types.h /usr/src/debug/strace/6.1-r0/src/xlat/keyctl_commands.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_spec_cmds.h /usr/src/debug/strace/6.1-r0/src/xlat/sockopt_txrehash_vals.h /usr/src/debug/strace/6.1-r0/tests/set_sigign.c /usr/src/debug/strace/6.1-r0/tests/umovestr2.c /usr/src/debug/strace/6.1-r0/tests/linkat--secontext.c /usr/src/debug/strace/6.1-r0/tests/openat--secontext.c /usr/src/debug/strace/6.1-r0/src/xlat/termios_cc.h /usr/src/debug/strace/6.1-r0/tests/btrfs.c /usr/src/debug/strace/6.1-r0/tests/mbind.c /usr/src/debug/strace/6.1-r0/tests/mknod.c /usr/src/debug/strace/6.1-r0/tests/mlock.c /usr/src/debug/strace/6.1-r0/tests/mount.c /usr/src/debug/strace/6.1-r0/tests/alarm.c /usr/src/debug/strace/6.1-r0/tests/rmdir.c /usr/src/
 debug/strace/6.1-r0/tests/fcntl.c /usr/src/debug/strace/6.1-r0/tests/flock.c /usr/src/debug/strace/6.1-r0/tests/fsync.c /usr/src/debug/strace/6.1-r0/src/xlat/getsock_ip_options.h /usr/src/debug/strace/6.1-r0/src/xlat/setsock_ip_options.h /usr/src/debug/strace/6.1-r0/tests/pidns.h /usr/src/debug/strace/6.1-r0/src/xlat/ubi_volume_types.h /usr/src/debug/strace/6.1-r0/tests/tests.h /usr/src/debug/strace/6.1-r0/tests/pipe_maxfd.c /usr/src/debug/strace/6.1-r0/tests/ioctl_fs_f.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_xdp_attached_mode.h /usr/src/debug/strace/6.1-r0/tests/prctl-no-args.c /usr/src/debug/strace/6.1-r0/src/xlat/ptp_pin_funcs.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_prog_types.h /usr/src/debug/strace/6.1-r0/src/xlat/notifyflags.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_af_spec_bridge_vlan_tunnel_info_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/rtc_features.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_buf_flags_ts_src.h /usr/src/debug/strace/6.1-r0/src/xlat
 /kd_key_spec_keys.h /usr/src/debug/strace/6.1-r0/src/xlat/netlink_sk_meminfo_indices.h /usr/src/debug/strace/6.1-r0/src/xlat/usagewho.h /usr/src/debug/strace/6.1-r0/tests/kexec_file_load.c /usr/src/debug/strace/6.1-r0/src/xlat/if_dqinfo_flags.h /usr/src/debug/strace/6.1-r0/tests/setpgrp-exec.c /usr/src/debug/strace/6.1-r0/tests/get_page_size.c /usr/src/debug/strace/6.1-r0/src/xlat/routing_types.h /usr/src/debug/strace/6.1-r0/src/xlat/seccomp_ret_action.h /usr/src/debug/strace/6.1-r0/tests/ioctl_inotify.c /usr/src/debug/strace/6.1-r0/src/xlat/inet_diag_req_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/whence_codes.h /usr/src/debug/strace/6.1-r0/tests/ipc_msgbuf.c /usr/src/debug/strace/6.1-r0/src/xlat/inet_diag_ulp_info_mptcp_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/neighbor_cache_entry_ext_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_dev_replace_results.h /usr/src/debug/strace/6.1-r0/tests/print_quoted_string.c /usr/src/debug/strace/6.1-r0/src/xlat/ifstats_xstats_type_att
 rs.h /usr/src/debug/strace/6.1-r0/tests/fcntl-common.c /usr/src/debug/strace/6.1-r0/tests/semop-common.c /usr/src/debug/strace/6.1-r0/tests/getrusage.c /usr/src/debug/strace/6.1-r0/tests/ioctl_nsfs.c /usr/src/debug/strace/6.1-r0/src/xlat/pr_mce_kill.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ip6mra_creport_attr.h /usr/src/debug/strace/6.1-r0/src/xlat/ipc_private.h /usr/src/debug/strace/6.1-r0/src/xlat/kvm_cpuid_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/nf_acct_msg_types.h /usr/src/debug/strace/6.1-r0/src/xlat/perf_attr_size.h /usr/src/debug/strace/6.1-r0/tests/mmsg-silent.c /usr/src/debug/strace/6.1-r0/tests/delete_module.c /usr/src/debug/strace/6.1-r0/tests/kexec_load.c /usr/src/debug/strace/6.1-r0/src/xlat/gpio_v2_line_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_can_raw_options.h /usr/src/debug/strace/6.1-r0/tests/net-yy-inet.c /usr/src/debug/strace/6.1-r0/src/xlat/nl_bridge_vlan_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_ext_filter_flags.h /usr/src/debug
 /strace/6.1-r0/src/xlat/nf_cttimeout_msg_types.h /usr/src/debug/strace/6.1-r0/tests/getpgrp.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_bridge_modes.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_control_classes.h /usr/src/debug/strace/6.1-r0/src/xlat/inet_diag_ulp_info_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/sg_scsi_reset.h /usr/src/debug/strace/6.1-r0/src/xlat/nl_netfilter_msg_types.h /usr/src/debug/strace/6.1-r0/src/xlat/hdio_drive_cmds.h /usr/src/debug/strace/6.1-r0/src/xlat/efd_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/sfd_flags.h /usr/src/debug/strace/6.1-r0/tests/pread64-pwrite64.c /usr/src/debug/strace/6.1-r0/tests/ipc_shm.c /usr/src/debug/strace/6.1-r0/src/xlat/ieee802154_addrs.h /usr/src/debug/strace/6.1-r0/src/xlat/uring_op_flags.h /usr/src/debug/strace/6.1-r0/tests/ioctl_dm.c /usr/src/debug/strace/6.1-r0/src/xlat/caif_protocols.h /usr/src/debug/strace/6.1-r0/src/xlat/futexwakeops.h /usr/src/debug/strace/6.1-r0/src/xlat/ptrace_events.h /usr/src/debug/strace/
 6.1-r0/tests/nlattr_ifla_linkinfo.c /usr/src/debug/strace/6.1-r0/tests/fchmodat--secontext.c /usr/src/debug/strace/6.1-r0/tests/nlattr_ifla_proto_down_reason.c /usr/src/debug/strace/6.1-r0/tests/dup.c /usr/src/debug/strace/6.1-r0/src/xlat/fs_xflags.h /usr/src/debug/strace/6.1-r0/tests/unix-pair-sendto-recvfrom.c /usr/src/debug/strace/6.1-r0/src/xlat/nf_hook_msg_types.h /usr/src/debug/strace/6.1-r0/tests/process_madvise.c /usr/src/debug/strace/6.1-r0/src/xlat/fsopen_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/resources.h /usr/src/debug/strace/6.1-r0/tests/signalfd4.c /usr/src/debug/strace/6.1-r0/tests/xstatfsx.c /usr/src/debug/strace/6.1-r0/src/xlat/kexec_file_load_flags.h /usr/src/debug/strace/6.1-r0/tests/seccomp-filter-v.c /usr/src/debug/strace/6.1-r0/src/xlat/f_seals.h /usr/src/debug/strace/6.1-r0/tests/fanotify_init.c /usr/src/debug/strace/6.1-r0/src/xlat/quotacmds.h /usr/src/debug/strace/6.1-r0/tests/fanotify_mark.c /usr/src/debug/strace/6.1-r0/tests/init_module.c /usr/src/de
 bug/strace/6.1-r0/src/xlat/scmvals.h /usr/src/debug/strace/6.1-r0/tests/prctl-pac-reset-keys.c /usr/src/debug/strace/6.1-r0/tests/umovestr_cached_adjacent.c /usr/src/debug/strace/6.1-r0/tests/get_process_reaper.c /usr/src/debug/strace/6.1-r0/src/xlat/isdn_protocols.h /usr/src/debug/strace/6.1-r0/src/xlat/unix_diag_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/smc_diag_extended_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_tca_stab_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/key_spec.h /usr/src/debug/strace/6.1-r0/src/xlat/evdev_keycode.h /usr/src/debug/strace/6.1-r0/tests/mmsg_name.c /usr/src/debug/strace/6.1-r0/tests/block_reset_raise_run.c /usr/src/debug/strace/6.1-r0/src/xlat/bpf_query_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_input_types.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_tuner_types.h /usr/src/debug/strace/6.1-r0/src/xlat/kd_font_ops.h /usr/src/debug/strace/6.1-r0/src/xlat/uffd_register_ioctl_flags.h /usr/src/debug/strace/6.1-r0/tests/prctl-name.c /usr
 /src/debug/strace/6.1-r0/tests/ioctl_tiocm.c /usr/src/debug/strace/6.1-r0/src/xlat/perf_sw_ids.h /usr/src/debug/strace/6.1-r0/src/xlat/nf_nftables_msg_types.h /usr/src/debug/strace/6.1-r0/tests/bpf-obj_get_info_by_fd.c /usr/src/debug/strace/6.1-r0/tests/prctl-set-ptracer-success.c /usr/src/debug/strace/6.1-r0/src/xlat/packet_mreq_type.h /usr/src/debug/strace/6.1-r0/src/xlat/snmp_ip_stats.h /usr/src/debug/strace/6.1-r0/tests/scm_rights.c /usr/src/debug/strace/6.1-r0/src/xlat/nf_ctnetlink_msg_types.h /usr/src/debug/strace/6.1-r0/src/xlat/module_init_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/baud_options.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_netconf_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/epollflags.h /usr/src/debug/strace/6.1-r0/src/xlat/mpol_modes.h /usr/src/debug/strace/6.1-r0/src/xlat/mq_attr_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/hdio_ide_nice.h /usr/src/debug/strace/6.1-r0/src/xlat/nl_netfilter_subsys_ids.h /usr/src/debug/strace/6.1-r0/src/xlat/audit_arch.
 h /usr/src/debug/strace/6.1-r0/tests/s390_guarded_storage.c /usr/src/debug/strace/6.1-r0/src/xlat/inet_diag_bytecodes.h /usr/src/debug/strace/6.1-r0/tests/futex_waitv.c /usr/src/debug/strace/6.1-r0/tests/prctl-capbset.c /usr/src/debug/strace/6.1-r0/tests/file_handle.c /usr/src/debug/strace/6.1-r0/src/xlat/setns_types.h /usr/src/debug/strace/6.1-r0/tests/tee.c /usr/src/debug/strace/6.1-r0/tests/tracer_ppid_pgid_sid.c /usr/src/debug/strace/6.1-r0/tests/status-all.c /usr/src/debug/strace/6.1-r0/tests/open--secontext.c /usr/src/debug/strace/6.1-r0/tests/faccessat-y--secontext.c /usr/src/debug/strace/6.1-r0/tests/tampering-notes.c /usr/src/debug/strace/6.1-r0/tests/ipc_sem.c /usr/src/debug/strace/6.1-r0/tests/recvfrom.c /usr/src/debug/strace/6.1-r0/tests/sxetmask.c /usr/src/debug/strace/6.1-r0/src/xlat/fcntlcmds.h /usr/src/debug/strace/6.1-r0/tests/fallocate.c /usr/src/debug/strace/6.1-r0/tests/ftruncate.c /usr/src/debug/strace/6.1-r0/tests/init_delete_module.h /usr/src/debug/strace/6.1-
 r0/src/xlat/perf_event_open_flags.h /usr/src/debug/strace/6.1-r0/tests/rt_sigqueueinfo.c /usr/src/debug/strace/6.1-r0/src/xlat/pr_pac_enabled_keys.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_device_capabilities_flags.h /usr/src/debug/strace/6.1-r0/tests/nfnetlink_acct.c /usr/src/debug/strace/6.1-r0/src/xlat/fs_ioc_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/siginfo_codes.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_balance_state.h /usr/src/debug/strace/6.1-r0/src/xlat/sync_file_range_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_tuner_capabilities.h /usr/src/debug/strace/6.1-r0/tests/recvmmsg-timeout.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_balance_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/archvals.h /usr/src/debug/strace/6.1-r0/tests/sethostname.c /usr/src/debug/strace/6.1-r0/tests/file_handle--secontext.c /usr/src/debug/strace/6.1-r0/tests/ftruncate64.c /usr/src/debug/strace/6.1-r0/tests/ptrace_syscall_info.c /usr/src/debug/strace/6.1-r0/src/xlat/netlink_flags.h 
 /usr/src/debug/strace/6.1-r0/tests/sockaddr_xlat.c /usr/src/debug/strace/6.1-r0/tests/rt_sigpending.c /usr/src/debug/strace/6.1-r0/src/xlat/prctl_options.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_tagged_addr_mte_tcf.h /usr/src/debug/strace/6.1-r0/tests/add_key.c /usr/src/debug/strace/6.1-r0/src/xlat/mdb_states.h /usr/src/debug/strace/6.1-r0/src/xlat/dirent_types.h /usr/src/debug/strace/6.1-r0/tests/msg_name.c /usr/src/debug/strace/6.1-r0/src/xlat/evdev_mtslots.h /usr/src/debug/strace/6.1-r0/tests/pkey_free.c /usr/src/debug/strace/6.1-r0/tests/sockname.c /usr/src/debug/strace/6.1-r0/src/xlat/kd_key_ascii_keys.h /usr/src/debug/strace/6.1-r0/src/xlat/unix_diag_show.h /usr/src/debug/strace/6.1-r0/tests/nlattr_ifaddrlblmsg.c /usr/src/debug/strace/6.1-r0/src/xlat/routing_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/evdev_ff_types.h /usr/src/debug/strace/6.1-r0/src/xlat/snmp_icmp6_stats.h /usr/src/debug/strace/6.1-r0/src/xlat/x86_xfeature_bits.h /usr/src/debug/strace/6.1-r0/src/xlat/bsg_
 flags.h /usr/src/debug/strace/6.1-r0/src/xlat/msg_flags.h /usr/src/debug/strace/6.1-r0/tests/fadvise64_64.c /usr/src/debug/strace/6.1-r0/src/xlat/ebpf_mode.h /usr/src/debug/strace/6.1-r0/src/xlat/ebpf_regs.h /usr/src/debug/strace/6.1-r0/src/xlat/ebpf_size.h /usr/src/debug/strace/6.1-r0/tests/utimensat.c /usr/src/debug/strace/6.1-r0/tests/fill_memory.c /usr/src/debug/strace/6.1-r0/src/xlat/mount_attr_propagation.h /usr/src/debug/strace/6.1-r0/tests/nlattr_cachereport.c /usr/src/debug/strace/6.1-r0/tests/mq_sendrecv.c /usr/src/debug/strace/6.1-r0/tests/semtimedop-common.c /usr/src/debug/strace/6.1-r0/src/xlat/falloc_flags.h /usr/src/debug/strace/6.1-r0/tests/io_uring_setup.c /usr/src/debug/strace/6.1-r0/src/xlat/seccomp_ops.h /usr/src/debug/strace/6.1-r0/tests/oldselect.c /usr/src/debug/strace/6.1-r0/src/xlat/fdb_notify_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_sched_core_cmds.h /usr/src/debug/strace/6.1-r0/tests/nlattr_fib_rule_hdr.c /usr/src/debug/strace/6.1-r0/tests/io_uring
 _enter.c /usr/src/debug/strace/6.1-r0/tests/ioctl_rtc.c /usr/src/debug/strace/6.1-r0/src/xlat/mbind_flags.h /usr/src/debug/strace/6.1-r0/tests/xetitimer.c /usr/src/debug/strace/6.1-r0/src/xlat/clone_flags.h /usr/src/debug/strace/6.1-r0/tests/setfsugid.c /usr/src/debug/strace/6.1-r0/tests/setreugid.c /usr/src/debug/strace/6.1-r0/tests/readlink.c /usr/src/debug/strace/6.1-r0/src/xlat/uffd_copy_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/ptp_perout_flags.h /usr/src/debug/strace/6.1-r0/tests/poke-sendfile.c /usr/src/debug/strace/6.1-r0/tests/stack-fcall.c /usr/src/debug/strace/6.1-r0/tests/errno2name.c /usr/src/debug/strace/6.1-r0/tests/stack-fcall.h /usr/src/debug/strace/6.1-r0/src/xlat/perf_hw_cache_op_id.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_pppol2tp_options.h /usr/src/debug/strace/6.1-r0/tests/attach-f-p-cmd.c /usr/src/debug/strace/6.1-r0/tests/futex.c /usr/src/debug/strace/6.1-r0/tests/ioctl.c /usr/src/debug/strace/6.1-r0/tests/lseek.c /usr/src/debug/strace/6.1-r0/tests/pa
 use.c /usr/src/debug/strace/6.1-r0/tests/pidns.c /usr/src/debug/strace/6.1-r0/tests/pipe2.c /usr/src/debug/strace/6.1-r0/tests/ppoll.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_logical_ino_args_flags.h /usr/src/debug/strace/6.1-r0/tests/delay.c /usr/src/debug/strace/6.1-r0/tests/dirfd.c /usr/src/debug/strace/6.1-r0/src/xlat/uffd_register_mode_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/arp_hardware_types.h /usr/src/debug/strace/6.1-r0/src/xlat/sigchld_codes.h /usr/src/debug/strace/6.1-r0/tests/localtime.c /usr/src/debug/strace/6.1-r0/tests/ioctl_watchdog.c /usr/src/debug/strace/6.1-r0/tests/renameat2.c /usr/src/debug/strace/6.1-r0/tests/print_ppid_tracerpid.c /usr/src/debug/strace/6.1-r0/tests/mq.c /usr/src/debug/strace/6.1-r0/tests/s390_runtime_instr.c /usr/src/debug/strace/6.1-r0/tests/wait4.c /usr/src/debug/strace/6.1-r0/tests/umask.c /usr/src/debug/strace/6.1-r0/tests/uname.c /usr/src/debug/strace/6.1-r0/src/xlat/unshare_flags.h /usr/src/debug/strace/6.1-r0/tests/ustat.c /us
 r/src/debug/strace/6.1-r0/tests/sync_file_range2.c /usr/src/debug/strace/6.1-r0/tests/utime.c /usr/src/debug/strace/6.1-r0/tests/times.c /usr/src/debug/strace/6.1-r0/tests/tkill.c /usr/src/debug/strace/6.1-r0/tests/nlattr_ifstats.c /usr/src/debug/strace/6.1-r0/tests/get_sigset_size.c /usr/src/debug/strace/6.1-r0/tests/restart_syscall.c /usr/src/debug/strace/6.1-r0/tests/net-tpacket_stats.c /usr/src/debug/strace/6.1-r0/tests/nlattr_smc_diag_msg.c /usr/src/debug/strace/6.1-r0/src/xlat/kd_key_fn_keys.h /usr/src/debug/strace/6.1-r0/src/xlat/waitid_types.h /usr/src/debug/strace/6.1-r0/src/xlat/name_to_handle_at_flags.h /usr/src/debug/strace/6.1-r0/tests/netlink_inet_diag.c /usr/src/debug/strace/6.1-r0/tests/netlink_sock_diag.c /usr/src/debug/strace/6.1-r0/tests/netlink_unix_diag.c /usr/src/debug/strace/6.1-r0/tests/pidns-cache.c /usr/src/debug/strace/6.1-r0/src/xlat/xattrflags.h /usr/src/debug/strace/6.1-r0/tests/sockopt-timestamp.c /usr/src/debug/strace/6.1-r0/src/xlat/kvm_cap.h /usr/sr
 c/debug/strace/6.1-r0/tests/sockopt-sol_socket.c /usr/src/debug/strace/6.1-r0/tests/fsopen.c /usr/src/debug/strace/6.1-r0/tests/ioctl_uffdio.c /usr/src/debug/strace/6.1-r0/src/xlat/pollflags.h /usr/src/debug/strace/6.1-r0/src/xlat/xfs_dqblk_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/xfs_quota_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_mdba_mdb_eattr_attrs.h /usr/src/debug/strace/6.1-r0/tests/ioctl_winsize.c /usr/src/debug/strace/6.1-r0/src/xlat/bpf_src.h /usr/src/debug/strace/6.1-r0/tests/fsmount.c /usr/src/debug/strace/6.1-r0/tests/ksysent.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_af_spec_inet_attrs.h /usr/src/debug/strace/6.1-r0/tests/netlink_kobject_uevent.c /usr/src/debug/strace/6.1-r0/tests/preadv2-pwritev2.c /usr/src/debug/strace/6.1-r0/tests/ioctl_mtd.c /usr/src/debug/strace/6.1-r0/tests/xstatx.c /usr/src/debug/strace/6.1-r0/src/xlat/ipc_msg_flags.h /usr/src/debug/strace/6.1-r0/tests/fchmodat.c /usr/src/debug/strace/6.1-r0/tests/nsyscalls.c /usr/src/debug/s
 trace/6.1-r0/src/xlat/ieee802154_pan_ids.h /usr/src/debug/strace/6.1-r0/tests/readahead.c /usr/src/debug/strace/6.1-r0/tests/net-icmp_filter.c /usr/src/debug/strace/6.1-r0/tests/ioctl_block.c /usr/src/debug/strace/6.1-r0/src/xlat/pr_set_mm.h /usr/src/debug/strace/6.1-r0/src/xlat/ioprio_class.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_class.h /usr/src/debug/strace/6.1-r0/src/xlat/rwf_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/fsmagic.h /usr/src/debug/strace/6.1-r0/tests/ioctl_loop.c /usr/src/debug/strace/6.1-r0/tests/nfnetlink_ctnetlink.c /usr/src/debug/strace/6.1-r0/tests/preadv.c /usr/src/debug/strace/6.1-r0/tests/remap_file_pages.c /usr/src/debug/strace/6.1-r0/src/xlat/bdaddr_types.h /usr/src/debug/strace/6.1-r0/src/xlat/futexbitset.h /usr/src/debug/strace/6.1-r0/src/xlat/tcflsh_options.h /usr/src/debug/strace/6.1-r0/src/xlat/nf_ctnetlink_exp_msg_types.h /usr/src/debug/strace/6.1-r0/src/xlat/routing_protocols.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_nexthop_attrs.h /usr/sr
 c/debug/strace/6.1-r0/src/xlat/kd_key_tables.h /usr/src/debug/strace/6.1-r0/tests/faccessat2.c /usr/src/debug/strace/6.1-r0/src/xlat/faccessat_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/ip_type_of_services.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_meta_fmts.h /usr/src/debug/strace/6.1-r0/tests/mknodat.c /usr/src/debug/strace/6.1-r0/tests/semtimedop-ipc.c /usr/src/debug/strace/6.1-r0/src/xlat/packet_diag_attrs.h /usr/src/debug/strace/6.1-r0/tests/netlink_audit.c /usr/src/debug/strace/6.1-r0/tests/netlink_route.c /usr/src/debug/strace/6.1-r0/src/xlat/uring_ops.h /usr/src/debug/strace/6.1-r0/tests/ioctl_v4l2-success.c /usr/src/debug/strace/6.1-r0/src/xlat/kd_key_shift_keys.h /usr/src/debug/strace/6.1-r0/src/xlat/inet_protocols.h /usr/src/debug/strace/6.1-r0/tests/sigaction.c /usr/src/debug/strace/6.1-r0/tests/at_fdcwd-pathmax.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_cont_reading_from_srcdev_mode.h /usr/src/debug/strace/6.1-r0/src/xlat/pr_cap_ambient.h /usr/src/debug/strace/6
 .1-r0/tests/sysctl.c /usr/src/debug/strace/6.1-r0/tests/tgkill.c /usr/src/debug/strace/6.1-r0/tests/keyctl.c /usr/src/debug/strace/6.1-r0/tests/signal.c /usr/src/debug/strace/6.1-r0/src/xlat/sock_ax25_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_caif_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_dccp_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_ipv6_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_irda_options.h /usr/src/debug/strace/6.1-r0/src/xlat/sock_iucv_options.h /usr/src/debug/strace/6.1-r0/src/xlat/statfs_flags.h /usr/src/debug/strace/6.1-r0/tests/pidfd_open.c /usr/src/debug/strace/6.1-r0/tests/net-accept-connect.c /usr/src/debug/strace/6.1-r0/src/xlat/landlock_rule_types.h /usr/src/debug/strace/6.1-r0/tests/prctl-sve.c /usr/src/debug/strace/6.1-r0/tests/stack-fcall-0.c /usr/src/debug/strace/6.1-r0/tests/prctl-fp-mode.c /usr/src/debug/strace/6.1-r0/tests/stack-fcall-1.c /usr/src/debug/strace/6.1-r0/tests/stack-fcall-2.c /usr/src/debug/strace/6.1-r0
 /tests/stack-fcall-3.c /usr/src/debug/strace/6.1-r0/src/xlat/fspick_flags.h /usr/src/debug/strace/6.1-r0/tests/strace-n.c /usr/src/debug/strace/6.1-r0/tests/getuid.c /usr/src/debug/strace/6.1-r0/tests/fchmod.c /usr/src/debug/strace/6.1-r0/tests/getcwd.c /usr/src/debug/strace/6.1-r0/tests/getgid.c /usr/src/debug/strace/6.1-r0/tests/getpid.c /usr/src/debug/strace/6.1-r0/tests/getsid.c /usr/src/debug/strace/6.1-r0/tests/gettid.c /usr/src/debug/strace/6.1-r0/tests/waitid.c /usr/src/debug/strace/6.1-r0/tests/clock_nanosleep.c /usr/src/debug/strace/6.1-r0/src/xlat/futexwakecmps.h /usr/src/debug/strace/6.1-r0/tests/inject-nf.c /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_framesize_types.h /usr/src/debug/strace/6.1-r0/tests/ioctl_sg_io_v4.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_nexthop_grp_types.h /usr/src/debug/strace/6.1-r0/tests/netlink_netfilter.c /usr/src/debug/strace/6.1-r0/tests/getsockname.c /usr/src/debug/strace/6.1-r0/src/xlat/pkey_access.h /usr/src/debug/strace/6.1-r0/tests/ch
 eck_sigblock.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_vf_stats_attrs.h /usr/src/debug/strace/6.1-r0/tests/epoll_create.c /usr/src/debug/strace/6.1-r0/tests/memfd_create.c /usr/src/debug/strace/6.1-r0/tests/timer_create.c /usr/src/debug/strace/6.1-r0/src/xlat/kvm_exit_reason.h /usr/src/debug/strace/6.1-r0/tests/nlattr_crypto_user_alg.c /usr/src/debug/strace/6.1-r0/src/xlat/bpf_attach_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/modem_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/nlmsgerr_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/skf_ad.h /usr/src/debug/strace/6.1-r0/tests/execve--secontext.c /usr/src/debug/strace/6.1-r0/tests/strace-x.c /usr/src/debug/strace/6.1-r0/src/xlat/sigpoll_codes.h /usr/src/debug/strace/6.1-r0/src/xlat/sigprof_codes.h /usr/src/debug/strace/6.1-r0/tests/chdir.c /usr/src/debug/strace/6.1-r0/tests/chmod.c /usr/src/debug/strace/6.1-r0/tests/semop.c /usr/src/debug/strace/6.1-r0/tests/setns.c /usr/src/debug/strace/6.1-r0/tests/shmxt.c /usr/src/debug/s
 trace/6.1-r0/tests/sleep.c /usr/src/debug/strace/6.1-r0/tests/statx.c /usr/src/debug/strace/6.1-r0/src/xlat/bpf_map_lookup_elem_flags.h /usr/src/debug/strace/6.1-r0/tests/faccessat--secontext.c /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_ifla_br_boolopts.h /usr/src/debug/strace/6.1-r0/tests/qual_inject-signal.c /usr/src/debug/strace/6.1-r0/src/xlat/personality_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/personality_types.h /usr/src/debug/strace/6.1-r0/src/xlat/bpf_commands.h /usr/src/debug/strace/6.1-r0/src/xlat/ptrace_syscall_info_op.h /usr/src/debug/strace/6.1-r0/tests/unblock_reset_raise.c /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_balance_ctl_cmds.h /usr/src/debug/strace/6.1-r0/src/xlat/irda_protocols.h /usr/src/debug/strace/6.1-r0/src/xlat/btrfs_qgroup_limit_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/rtc_backup_switch_modes.h /usr/src/debug/strace/6.1-r0/tests/unlinkat.c /usr/src/debug/strace/6.1-r0/tests/membarrier.c /usr/src/debug/strace/6.1-r0/tests/getrandom.c /usr/src
 /debug/strace/6.1-r0/src/xlat/seccomp_mode.h /usr/src/debug/strace/6.1-r0/src/xlat/nfc_sockaddr_protocols.h /usr/src/debug/strace/6.1-r0/src/xlat/if_dqblk_valid.h /usr/src/debug/strace/6.1-r0/tests/faccessat.c /usr/src/debug/strace/6.1-r0/src/xlat/cap_version.h /usr/src/debug/strace/6.1-r0/tests/secontext.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_streaming_capabilities.h /usr/src/debug/strace/6.1-r0/tests/open_tree.c /usr/src/debug/strace/6.1-r0/src/xlat/lockfcmds.h /usr/src/debug/strace/6.1-r0/src/xlat/socktypes.h /usr/src/debug/strace/6.1-r0/src/xlat/rtnl_nha_res_bucket_attrs.h /usr/src/debug/strace/6.1-r0/src/xlat/secbits.h /usr/src/debug/strace/6.1-r0/src/xlat/lirc_modes.h /usr/src/debug/strace/6.1-r0/src/xlat/rtc_vl_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/gpio_v2_line_attr_ids.h /usr/src/debug/strace/6.1-r0/tests/xetpgid.c /usr/src/debug/strace/6.1-r0/src/xlat/epollctls.h /usr/src/debug/strace/6.1-r0/tests/ipc.c /usr/src/debug/strace/6.1-r0/src/xlat/seccomp_ioctl_addfd
 _flags.h /usr/src/debug/strace/6.1-r0/src/xlat/uring_enter_flags.h /usr/src/debug/strace/6.1-r0/src/xlat/v4l2_control_ids.h /usr/src/debug/strace/6.1-r0/tests/ioctl_kvm_run_common.c"
packages/core2-32-poky-linux/strace/strace-staticdev: PKGV changed from 6.0 [default] to 6.1 [default]
packages/core2-32-poky-linux/strace/strace-staticdev: PV changed from "6.0" to "6.1"
packages/core2-32-poky-linux/strace/strace: PKGV changed from 6.0 [default] to 6.1 [default]
packages/core2-32-poky-linux/strace/strace: PV changed from "6.0" to "6.1"
packages/core2-32-poky-linux/strace/strace: PKGSIZE changed from 1359241 to 1351049 (-1%)

--===============7697515010600759681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 888 .bb files complete (0 cached, 888 parsed). 1672 targets, 54 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f6a1ef0a7880097675304ae916492a723736a35c"
workspace            = "master:46fd76aa07bd431f0ba73bdafeb7bf5aa31cef25"

Initialising tasks...done.
Sstate summary: Wanted 28 Local 5 Mirrors 0 Missed 23 Current 476 (17% match, 95% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1450 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_fetch)
NOTE: Running task 1505 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_fetch)
NOTE: Running task 1506 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_fetch)
NOTE: Running task 1544 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_fetch)
NOTE: Running task 1629 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.36.0.bb:do_populate_sysroot)
NOTE: Running task 1754 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.8.bb:do_package_write_rpm)
NOTE: recipe strace-6.1-r0: task do_fetch: Started
NOTE: recipe gawk-5.2.1-r0: task do_fetch: Started
NOTE: recipe bluez5-5.65-r0: task do_fetch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Started
NOTE: recipe perl-5.36.0-r0: task do_populate_sysroot: Started
NOTE: Running task 1755 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.4.bb:do_package_write_rpm)
NOTE: recipe gawk-5.2.1-r0: task do_fetch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_fetch: Succeeded
NOTE: recipe bluez5-5.65-r0: task do_fetch: Succeeded
NOTE: recipe strace-6.1-r0: task do_fetch: Succeeded
NOTE: Running task 1756 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_unpack)
NOTE: Running task 1757 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1758 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_unpack)
NOTE: Running task 1759 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_unpack)
NOTE: Running task 1760 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1761 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_unpack)
NOTE: recipe grep-3.8-r0: task do_package_write_rpm: Started
NOTE: recipe bluez5-5.65-r0: task do_unpack: Started
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Started
NOTE: recipe strace-6.1-r0: task do_unpack: Started
NOTE: recipe bluez5-5.65-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gawk-5.2.1-r0: task do_unpack: Started
NOTE: recipe gawk-5.2.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_unpack: Succeeded
NOTE: Running task 1764 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_patch)
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Started
NOTE: recipe gawk-5.2.1-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.65-r0: task do_unpack: Succeeded
NOTE: Running task 1765 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_patch)
NOTE: Running task 1766 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_patch)
NOTE: recipe gawk-5.2.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_patch: Succeeded
NOTE: Running task 1767 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-5.2.1-r0: task do_patch: Started
NOTE: recipe bluez5-5.65-r0: task do_patch: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe gawk-5.2.1-r0: task do_patch: Succeeded
NOTE: Running task 1768 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_deploy_source_date_epoch)
NOTE: recipe liberror-perl-0.17029-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-6.1-r0: task do_unpack: Succeeded
NOTE: Running task 1769 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_patch)
NOTE: recipe strace-6.1-r0: task do_patch: Started
NOTE: recipe gawk-5.2.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1770 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_configure)
NOTE: recipe bluez5-5.65-r0: task do_patch: Succeeded
NOTE: Running task 1771 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.65-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_configure: Started
NOTE: recipe bluez5-5.65-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe perl-5.36.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1772 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-6.1-r0: task do_patch: Succeeded
NOTE: Running task 1773 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1774 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_populate_lic)
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.65-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1775 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_configure)
NOTE: recipe strace-6.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe strace-6.1-r0: task do_populate_lic: Started
NOTE: recipe bluez5-5.65-r0: task do_configure: Started
NOTE: recipe strace-6.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_populate_lic unihash changed to cb92c8955a8e40eb7817e561dc9913c724d96ed2f5aac05c5150dc069a572d4e
NOTE: recipe strace-6.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1776 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure)
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure: Succeeded
NOTE: Running task 1777 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_configure_ptest_base)
NOTE: recipe make-4.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_configure_ptest_base: Succeeded
NOTE: Running task 1778 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile)
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_compile: Succeeded
NOTE: Running task 1779 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_compile_ptest_base)
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Started
NOTE: recipe grep-3.8-r0: task do_package_write_rpm: Succeeded
NOTE: recipe liberror-perl-0.17029-r1: task do_compile_ptest_base: Succeeded
NOTE: Running task 1780 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install)
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install: Succeeded
NOTE: Running task 1781 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_base)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_base: Succeeded
NOTE: Running task 1782 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_install_ptest_perl)
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_install_ptest_perl: Succeeded
NOTE: Running task 1783 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package)
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_package: Succeeded
NOTE: Running task 1784 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata)
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Started
NOTE: recipe liberror-perl-0.17029-r1: task do_packagedata: Succeeded
NOTE: recipe bluez5-5.65-r0: task do_configure: Succeeded
NOTE: Running task 1785 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.65-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.65-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1786 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_compile)
NOTE: recipe bluez5-5.65-r0: task do_compile: Started
NOTE: recipe bluez5-5.65-r0: task do_compile: Succeeded
NOTE: Running task 1787 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.65-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_configure: Succeeded
NOTE: Running task 1788 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_configure_ptest_base)
NOTE: recipe gawk-5.2.1-r0: task do_configure_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 1789 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_compile)
NOTE: recipe gawk-5.2.1-r0: task do_compile: Started
NOTE: recipe gawk-5.2.1-r0: task do_compile: Succeeded
NOTE: Running task 1790 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_compile_ptest_base)
NOTE: recipe gawk-5.2.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1791 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_install)
NOTE: recipe gawk-5.2.1-r0: task do_install: Started
NOTE: recipe gawk-5.2.1-r0: task do_install: Succeeded
NOTE: Running task 1792 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_install_ptest_base)
NOTE: recipe gawk-5.2.1-r0: task do_install_ptest_base: Started
NOTE: recipe gawk-5.2.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1793 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package)
NOTE: recipe gawk-5.2.1-r0: task do_package: Started
NOTE: recipe gawk-5.2.1-r0: task do_package: Succeeded
NOTE: Running task 1794 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_packagedata)
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Started
NOTE: recipe gawk-5.2.1-r0: task do_packagedata: Succeeded
NOTE: Running task 1795 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.2.1.bb:do_package_write_rpm)
NOTE: Running task 1796 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.9.bb:do_package_write_rpm)
NOTE: Running task 1797 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_package_write_rpm)
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Started
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm: Started
NOTE: recipe sed-4.9-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gawk-5.2.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.65-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 1798 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_install)
NOTE: recipe bluez5-5.65-r0: task do_install: Started
NOTE: recipe bluez5-5.65-r0: task do_install: Succeeded
NOTE: Running task 1799 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.65-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.65-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 1800 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_populate_sysroot)
NOTE: Running task 1801 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_package)
NOTE: recipe bluez5-5.65-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.65-r0: task do_package: Started
NOTE: recipe bluez5-5.65-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 1802 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe strace-6.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe strace-6.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1803 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/strace/strace_6.1.bb:do_configure)
NOTE: recipe strace-6.1-r0: task do_configure: Started
NOTE: recipe bluez5-5.65-r0: task do_package: Succeeded
NOTE: Running task 1804 of 1815 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_packagedata)
NOTE: recipe bluez5-5.65-r0: task do_packagedata: Started
NOTE: recipe bluez5-5.65-r0: task do_packagedata: Failed
NOTE: recipe coreutils-9.1-r0: task do_package_write_rpm: Succeeded
NOTE: recipe strace-6.1-r0: task do_configure: Succeeded
NOTE: Tasks Summary: Attempted 1804 tasks of which 1750 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_packagedata
Summary: There was 1 WARNING message.
Summary: There were 12 ERROR messages, returning a non-zero exit code.
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-src went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-dbg went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-testtools went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-obex went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-noinst-tools went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-ptest went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-staticdev went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-dev went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-doc went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5-locale went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: QA Issue: Package version for package bluez5 went backwards which would break package feeds (from 0:5.66-r0 to 0:5.65-r0) [version-going-backwards]
ERROR: bluez5-5.65-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/bluez5/5.65-r0/temp/log.do_packagedata.2178179
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.65.bb:do_packagedata) failed with exit code '1'

--===============7697515010600759681==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/strace/strace-ptest: FILELIST: added "/usr/lib/strace/ptest/tests/ioctl_termios-v /usr/lib/strace/ptest/tests/ioctl_termios.gen.test /usr/lib/strace/ptest/tests/sysctl.gen.test /usr/lib/strace/ptest/tests/sysctl /usr/lib/strace/ptest/tests/ioctl_tiocm /usr/lib/strace/ptest/tests/ioctl_winsize /usr/lib/strace/ptest/tests/ioctl_termios-v.gen.test /usr/lib/strace/ptest/tests/ioctl_winsize.gen.test /usr/lib/strace/ptest/tests/ioctl_tiocm.gen.test /usr/lib/strace/ptest/tests/ioctl_termios"

--===============7697515010600759681==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-strace-upgrade-6.0-6.1.patch"

RnJvbSA1N2M2YjM4YTEwYTJlNDFmN2UyODQ3MTM0NGYyNjE1NmNmZjhmNWQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgRGVjIDIwMjIgMTI6MzY6NDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBz
dHJhY2U6IHVwZ3JhZGUgNi4wIC0+IDYuMQoKLS0tCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3Ry
YWNlL3tzdHJhY2VfNi4wLmJiID0+IHN0cmFjZV82LjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3N0cmFjZS97c3RyYWNlXzYuMC5iYiA9PiBzdHJhY2VfNi4xLmJifSAoOTYlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlXzYuMC5iYiBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlXzYuMS5iYgpzaW1pbGFyaXR5IGluZGV4
IDk2JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvc3RyYWNlL3N0cmFjZV82LjAu
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9zdHJhY2Uvc3RyYWNlXzYuMS5iYgpp
bmRleCA0ZmEzNTg5ZDE1Li5lMzZjNDQ0NzI1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvc3RyYWNlL3N0cmFjZV82LjAuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3N0
cmFjZS9zdHJhY2VfNi4xLmJiCkBAIC0xNCw3ICsxNCw3IEBAIFNSQ19VUkkgPSAiaHR0cHM6Ly9z
dHJhY2UuaW8vZmlsZXMvJHtQVn0vc3RyYWNlLSR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZp
bGU6Ly8wMDAxLXN0cmFjZS1maXgtcmVwcm9kdWNpYmlsdHktaXNzdWVzLnBhdGNoIFwKICAgICAg
ICAgICAgZmlsZTovL3NraXAtbG9hZC5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICI5MmQ3MjBhNjY2ODU1ZTlmMWM2YTExNTEyZmQ2ZTk5Njc0YTgyYmJmZTE0NDI1
NTc4MTVmMmNlOGUxMjkzMzM4IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjI1NzllOWNlYzM3ZGJi
Nzg2ZjZlYTBiZWJkMTVmNDBkZDU2MWVmMmJkZTJhMmEyZWNkY2U1OTYzYjAxODU5ZmQiCiAKIGlu
aGVyaXQgYXV0b3Rvb2xzIHB0ZXN0CiAKLS0gCjIuMzcuMwoK

--===============7697515010600759681==--

