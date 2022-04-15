Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21385C54F3E
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:55 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com
 (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web09.11560.1650052686605135165
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Apr 2022 12:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org
 header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=5W6R1J0p;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33,
 mailfrom: 010101802ecdee0e-b35a766a-5c79-486e-be6d-3a3827076b25-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1650052689;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date;
	bh=xbbz+sbt3oO00SSOTtJ0FWF1a1/hWjloNrPRXw14US4=;
	b=5W6R1J0plTi/1lHsa3KDtkEY09aHcmJCmB+aqG176vWRKpWvhJR2PQycNWYe9w+9
	6AR8S+bMlwlxh5i5rP+J3WD0U73I+So9L0+6+igjdB61zOwi2+At/KQ3Qew05M2Oy4N
	qzgTh/zrEWYbBCeFnbQIPm4snWbtCyjqIUPYGTzg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1650052689;
	h=Content-Type:MIME-Version:From:To:Subject:Message-Id:Date:Feedback-ID;
	bh=xbbz+sbt3oO00SSOTtJ0FWF1a1/hWjloNrPRXw14US4=;
	b=AL2M9Z7YJUBBeBBL34PyucfXBFpLaUe7PCEfVIhVqOR/sMZjxVlgLW0fpFwBUZ6S
	+lk2smnGZ3BNZGD7su341kDA9iMpWW1aj7rTbSLxF4dfafu/rqgIszur2d1XDGRn/n+
	s3ts/xJ+PyPduQK0ooikahirR8GxDUb4tygeSWFo=
Content-Type: multipart/mixed; boundary="===============3845701348291116268=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Subject: [AUH] libgit2: upgrading to 1.4.3 SUCCEEDED
Message-ID: 
 <010101802ecdee0e-b35a766a-5c79-486e-be6d-3a3827076b25-000000@us-west-2.amazonses.com>
Date: Fri, 15 Apr 2022 19:58:09 +0000
Feedback-ID: 
 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2022.04.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164514

--===============3845701348291116268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgit2* to *1.4.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-libgit2-upgrade-1.4.2-1.4.3.patch
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
--===============3845701348291116268==
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
meta-yocto-bsp       = "tmp-auh-upgrades:fac000b23f8ab9d1d75c7d38f6c53a524c077ce1"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 27 Local 12 Mirrors 0 Missed 15 Current 206 (44% match, 93% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 208 of 233 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 233 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_populate_sysroot_setscene)
NOTE: Running task 703 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_fetch)
NOTE: Running task 760 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_fetch)
NOTE: Running task 768 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_fetch)
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgit2-1.4.3-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.39-r0: task do_fetch: Started
NOTE: recipe libssh2-1.10.0-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.39-r0: task do_fetch: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 849 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_unpack)
NOTE: Running task 850 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgit2-1.4.3-r0: task do_fetch: Succeeded
NOTE: Running task 851 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_unpack)
NOTE: Running task 852 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 853 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_unpack)
NOTE: recipe libpcre2-10.39-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/libcap/2.63-r0/temp/log.do_packagedata_setscene.277785
NOTE: recipe libpcre2-10.39-r0: task do_prepare_recipe_sysroot: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 232 of 233 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_package_setscene)
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_unpack: Started
NOTE: recipe libgit2-1.4.3-r0: task do_unpack: Started
NOTE: recipe libssh2-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 854 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_patch)
NOTE: recipe libpcre2-10.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_unpack: Succeeded
NOTE: Running task 855 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_patch)
NOTE: recipe libssh2-1.10.0-r0: task do_patch: Started
NOTE: recipe libpcre2-10.39-r0: task do_patch: Started
NOTE: recipe libssh2-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 856 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre2-10.39-r0: task do_patch: Succeeded
NOTE: Running task 857 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_deploy_source_date_epoch)
NOTE: recipe libssh2-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgit2-1.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 858 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_patch)
NOTE: recipe libgit2-1.4.3-r0: task do_patch: Started
NOTE: recipe libssh2-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 859 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure)
NOTE: recipe libpcre2-10.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 860 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_configure)
NOTE: recipe libgit2-1.4.3-r0: task do_patch: Succeeded
NOTE: Running task 861 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 862 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_generate_toolchain_file)
NOTE: Running task 863 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_populate_lic)
NOTE: recipe libssh2-1.10.0-r0: task do_configure: Started
NOTE: recipe libpcre2-10.39-r0: task do_configure: Started
NOTE: recipe libgit2-1.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgit2-1.4.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe libgit2-1.4.3-r0: task do_populate_lic: Started
NOTE: recipe libgit2-1.4.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_populate_lic unihash changed to 6fd9a69e62a80609710e2c36eade5cc4c89ea0bb2c6c8a4deaba2861fdadcd1c
NOTE: recipe libgit2-1.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.63-r0: task do_package_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 879 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata)
NOTE: recipe libcap-2.63-r0: task do_packagedata: Started
NOTE: recipe libcap-2.63-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_configure: Succeeded
NOTE: Running task 882 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_compile)
NOTE: recipe libpcre2-10.39-r0: task do_compile: Started
NOTE: recipe libssh2-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 883 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 884 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile)
NOTE: recipe libssh2-1.10.0-r0: task do_compile: Started
NOTE: recipe libssh2-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 885 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 886 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install)
NOTE: recipe libssh2-1.10.0-r0: task do_install: Started
NOTE: recipe libssh2-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 887 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 888 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 889 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_package)
NOTE: recipe libssh2-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_package: Started
NOTE: recipe libssh2-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 890 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_packagedata)
NOTE: recipe libssh2-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libssh2-1.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_compile: Succeeded
NOTE: Running task 891 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_install)
NOTE: recipe libpcre2-10.39-r0: task do_install: Started
NOTE: recipe libpcre2-10.39-r0: task do_install: Succeeded
NOTE: Running task 892 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_populate_sysroot)
NOTE: Running task 893 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_package)
NOTE: recipe libpcre2-10.39-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.39-r0: task do_package: Started
NOTE: recipe libpcre2-10.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 894 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgit2-1.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgit2-1.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 895 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_configure)
NOTE: recipe libgit2-1.4.3-r0: task do_configure: Started
NOTE: recipe libpcre2-10.39-r0: task do_package: Succeeded
NOTE: Running task 896 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_packagedata)
NOTE: recipe libpcre2-10.39-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.39-r0: task do_packagedata: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_configure: Succeeded
NOTE: Running task 897 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_compile)
NOTE: recipe libgit2-1.4.3-r0: task do_compile: Started
NOTE: recipe libgit2-1.4.3-r0: task do_compile: Succeeded
NOTE: Running task 898 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_install)
NOTE: recipe libgit2-1.4.3-r0: task do_install: Started
NOTE: recipe libgit2-1.4.3-r0: task do_install: Succeeded
NOTE: Running task 899 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_package)
NOTE: Running task 900 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_populate_sysroot)
NOTE: recipe libgit2-1.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe libgit2-1.4.3-r0: task do_package: Started
NOTE: recipe libgit2-1.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_package: Succeeded
NOTE: Running task 901 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_packagedata)
NOTE: recipe libgit2-1.4.3-r0: task do_packagedata: Started
NOTE: recipe libgit2-1.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 902 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_package_write_rpm)
NOTE: Running task 903 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_package_qa)
NOTE: recipe libgit2-1.4.3-r0: task do_package_write_rpm: Started
NOTE: recipe libgit2-1.4.3-r0: task do_package_qa: Started
NOTE: recipe libgit2-1.4.3-r0: task do_package_qa: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 904 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_build)
NOTE: Tasks Summary: Attempted 904 tasks of which 862 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-src went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-dbg went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-staticdev went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-dev went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-doc went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-locale went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-bin went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3845701348291116268==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libgit2-upgrade-1.4.2-1.4.3.patch"

From 1e296a3543a1e33eb239a0497dd2281661601cc1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Apr 2022 19:36:49 +0000
Subject: [PATCH] libgit2: upgrade 1.4.2 -> 1.4.3

---
 .../libgit2/{libgit2_1.4.2.bb => libgit2_1.4.3.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libgit2/{libgit2_1.4.2.bb => libgit2_1.4.3.bb} (91%)

diff --git a/meta/recipes-support/libgit2/libgit2_1.4.2.bb b/meta/recipes-support/libgit2/libgit2_1.4.3.bb
similarity index 91%
rename from meta/recipes-support/libgit2/libgit2_1.4.2.bb
rename to meta/recipes-support/libgit2/libgit2_1.4.3.bb
index 88bf5a8520..7e27b5b018 100644
--- a/meta/recipes-support/libgit2/libgit2_1.4.2.bb
+++ b/meta/recipes-support/libgit2/libgit2_1.4.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e5a9227de4cb6afb5d35ed7b0fdf480d"
 DEPENDS = "curl openssl zlib libssh2 libgcrypt libpcre2"
 
 SRC_URI = "git://github.com/libgit2/libgit2.git;branch=maint/v1.4;protocol=https"
-SRCREV = "182d0d1ee933de46bf0b5a6ec269bafa77aba9a2"
+SRCREV = "465bbf88ea939a965fbcbade72870c61f815e457"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============3845701348291116268==
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
meta-yocto-bsp       = "tmp-auh-upgrades:fac000b23f8ab9d1d75c7d38f6c53a524c077ce1"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 27 Local 12 Mirrors 0 Missed 15 Current 206 (44% match, 93% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 208 of 233 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 233 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_populate_sysroot_setscene)
NOTE: Running task 703 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_fetch)
NOTE: Running task 761 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_fetch)
NOTE: Running task 768 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_fetch)
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgit2-1.4.3-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.39-r0: task do_fetch: Started
NOTE: recipe libssh2-1.10.0-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.39-r0: task do_fetch: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 849 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_unpack)
NOTE: Running task 850 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgit2-1.4.3-r0: task do_fetch: Succeeded
NOTE: Running task 851 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_unpack)
NOTE: Running task 852 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 853 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_unpack)
NOTE: recipe libpcre2-10.39-r0: task do_unpack: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/libcap/2.63-r0/temp/log.do_packagedata_setscene.257569
NOTE: recipe libpcre2-10.39-r0: task do_prepare_recipe_sysroot: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 232 of 233 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_package_setscene)
NOTE: recipe libssh2-1.10.0-r0: task do_unpack: Started
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_unpack: Started
NOTE: recipe libssh2-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 854 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_patch)
NOTE: recipe libpcre2-10.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_unpack: Succeeded
NOTE: Running task 855 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_patch)
NOTE: recipe libssh2-1.10.0-r0: task do_patch: Started
NOTE: recipe libpcre2-10.39-r0: task do_patch: Started
NOTE: recipe libssh2-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_patch: Succeeded
NOTE: Running task 856 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 857 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_deploy_source_date_epoch)
NOTE: recipe libssh2-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgit2-1.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 858 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_patch)
NOTE: recipe libgit2-1.4.3-r0: task do_patch: Started
NOTE: recipe libpcre2-10.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_patch: Succeeded
NOTE: Running task 859 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_configure)
NOTE: Running task 860 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure)
NOTE: Running task 861 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 862 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_generate_toolchain_file)
NOTE: Running task 863 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_populate_lic)
NOTE: recipe libpcre2-10.39-r0: task do_configure: Started
NOTE: recipe libgit2-1.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgit2-1.4.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe libssh2-1.10.0-r0: task do_configure: Started
NOTE: recipe libgit2-1.4.3-r0: task do_populate_lic: Started
NOTE: recipe libgit2-1.4.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_populate_lic unihash changed to 6fd9a69e62a80609710e2c36eade5cc4c89ea0bb2c6c8a4deaba2861fdadcd1c
NOTE: recipe libgit2-1.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.63-r0: task do_package_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 879 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata)
NOTE: recipe libcap-2.63-r0: task do_packagedata: Started
NOTE: recipe libcap-2.63-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_configure: Succeeded
NOTE: Running task 882 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_compile)
NOTE: recipe libpcre2-10.39-r0: task do_compile: Started
NOTE: recipe libssh2-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 883 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 884 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile)
NOTE: recipe libssh2-1.10.0-r0: task do_compile: Started
NOTE: recipe libssh2-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 885 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 886 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install)
NOTE: recipe libssh2-1.10.0-r0: task do_install: Started
NOTE: recipe libssh2-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 887 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 888 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 889 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_package)
NOTE: recipe libssh2-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_package: Started
NOTE: recipe libssh2-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 890 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_packagedata)
NOTE: recipe libssh2-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libssh2-1.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_compile: Succeeded
NOTE: Running task 891 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_install)
NOTE: recipe libpcre2-10.39-r0: task do_install: Started
NOTE: recipe libpcre2-10.39-r0: task do_install: Succeeded
NOTE: Running task 892 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_populate_sysroot)
NOTE: Running task 893 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_package)
NOTE: recipe libpcre2-10.39-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.39-r0: task do_package: Started
NOTE: recipe libpcre2-10.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 894 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgit2-1.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgit2-1.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 895 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_configure)
NOTE: recipe libgit2-1.4.3-r0: task do_configure: Started
NOTE: recipe libpcre2-10.39-r0: task do_package: Succeeded
NOTE: Running task 896 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_packagedata)
NOTE: recipe libpcre2-10.39-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.39-r0: task do_packagedata: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_configure: Succeeded
NOTE: Running task 897 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_compile)
NOTE: recipe libgit2-1.4.3-r0: task do_compile: Started
NOTE: recipe libgit2-1.4.3-r0: task do_compile: Succeeded
NOTE: Running task 898 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_install)
NOTE: recipe libgit2-1.4.3-r0: task do_install: Started
NOTE: recipe libgit2-1.4.3-r0: task do_install: Succeeded
NOTE: Running task 899 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_package)
NOTE: Running task 900 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_populate_sysroot)
NOTE: recipe libgit2-1.4.3-r0: task do_package: Started
NOTE: recipe libgit2-1.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe libgit2-1.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_package: Succeeded
NOTE: Running task 901 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_packagedata)
NOTE: recipe libgit2-1.4.3-r0: task do_packagedata: Started
NOTE: recipe libgit2-1.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 902 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_package_write_rpm)
NOTE: Running task 903 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_package_qa)
NOTE: recipe libgit2-1.4.3-r0: task do_package_write_rpm: Started
NOTE: recipe libgit2-1.4.3-r0: task do_package_qa: Started
NOTE: recipe libgit2-1.4.3-r0: task do_package_qa: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 904 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_build)
NOTE: Tasks Summary: Attempted 904 tasks of which 862 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-src went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-dbg went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-staticdev went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-dev went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-doc went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-locale went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-bin went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3845701348291116268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/libgit2/libgit2: FILELIST: removed "/usr/lib/libgit2.so.1.4.0", added "/usr/lib/libgit2.so.1.4.3"
Changes to packages/core2-32-poky-linux/libgit2 (sysroot):
  /usr/lib/libgit2.so.1.4 changed symlink target from libgit2.so.1.4.0 to libgit2.so.1.4.3
  /usr/lib/libgit2.so.1.4.0 moved to /usr/lib/libgit2.so.1.4.3

--===============3845701348291116268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 882 .bb files complete (0 cached, 882 parsed). 1641 targets, 50 skipped, 0 masked, 0 errors.
Removing 23 recipes from the core2-32 sysroot...done.
Removing 21 recipes from the qemux86 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:fac000b23f8ab9d1d75c7d38f6c53a524c077ce1"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 108 Local 93 Mirrors 0 Missed 15 Current 124 (86% match, 93% complete)
Removing 3 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 130 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 131 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 134 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_7.82.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 135 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgcrypt/libgcrypt_1.9.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 139 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 141 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running task 556 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_fetch)
NOTE: Running task 569 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_fetch)
NOTE: Running task 570 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_fetch)
NOTE: recipe libgcrypt-1.9.4-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-7.82.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.9.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-7.82.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.39-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libgit2-1.4.3-r0: task do_fetch: Started
NOTE: recipe libssh2-1.10.0-r0: task do_fetch: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.39-r0: task do_fetch: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_fetch: Succeeded
NOTE: Running task 598 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_unpack)
NOTE: Running task 599 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_unpack)
NOTE: recipe libgit2-1.4.3-r0: task do_fetch: Succeeded
NOTE: Running task 600 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_unpack)
NOTE: recipe libpcre2-10.39-r0: task do_unpack: Started
NOTE: recipe curl-7.82.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_unpack: Started
NOTE: Running setscene task 155 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 156 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.9.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 159 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata_setscene)
NOTE: Running setscene task 160 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.9.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_unpack: Started
NOTE: Running setscene task 161 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 163 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgpg-error/libgpg-error_1.44.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-7.82.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 164 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 165 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Started
NOTE: recipe libssh2-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 613 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_patch)
NOTE: recipe libgpg-error-1.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssh2-1.10.0-r0: task do_patch: Started
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/libcap/2.63-r0/temp/log.do_packagedata_setscene.318802
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 168 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_package_setscene)
NOTE: recipe openssl-3.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_unpack: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_patch: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgpg-error-1.44-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 174 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 175 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 177 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 178 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 618 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 625 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_patch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssh2-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.39-r0: task do_patch: Started
NOTE: recipe libgit2-1.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 628 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_patch)
NOTE: recipe libpcre2-10.39-r0: task do_patch: Succeeded
NOTE: recipe opkg-utils-0.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_patch: Started
NOTE: Running task 629 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_deploy_source_date_epoch)
NOTE: recipe opkg-utils-0.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_patch: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 638 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 639 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_generate_toolchain_file)
NOTE: Running task 640 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_populate_lic)
NOTE: recipe libssh2-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgit2-1.4.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe libgit2-1.4.3-r0: task do_populate_lic: Started
NOTE: recipe libgit2-1.4.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_populate_lic unihash changed to 6fd9a69e62a80609710e2c36eade5cc4c89ea0bb2c6c8a4deaba2861fdadcd1c
NOTE: recipe libgit2-1.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.63-r0: task do_package_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 183 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 184 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 187 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 188 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 189 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 190 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.7.bb:do_populate_sysroot_setscene)
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cracklib-2.9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 195 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 196 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 197 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 200 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 202 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 205 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 207 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 209 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 210 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 213 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 214 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 215 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_packagedata_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.3+gitAUTOINC+7a43f6fea9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 216 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 217 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 225 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-11.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 229 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.16.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 230 of 232 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.38.bb:do_populate_sysroot_setscene)
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-cross-i686-2.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 804 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 841 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 867 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata)
NOTE: recipe libssh2-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.63-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 870 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_configure)
NOTE: Running task 871 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure)
NOTE: recipe libcap-2.63-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_configure: Started
NOTE: recipe libssh2-1.10.0-r0: task do_configure: Started
NOTE: recipe libpcre2-10.39-r0: task do_configure: Succeeded
NOTE: Running task 874 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_compile)
NOTE: recipe libpcre2-10.39-r0: task do_compile: Started
NOTE: recipe libssh2-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 875 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 876 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile)
NOTE: recipe libssh2-1.10.0-r0: task do_compile: Started
NOTE: recipe libssh2-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 877 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 878 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install)
NOTE: recipe libssh2-1.10.0-r0: task do_install: Started
NOTE: recipe libssh2-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 879 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 880 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 881 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_package)
NOTE: recipe libssh2-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_package: Started
NOTE: recipe libssh2-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 882 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_packagedata)
NOTE: recipe libpcre2-10.39-r0: task do_compile: Succeeded
NOTE: Running task 883 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_install)
NOTE: recipe libssh2-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.39-r0: task do_install: Started
NOTE: recipe libssh2-1.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_install: Succeeded
NOTE: Running task 884 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_populate_sysroot)
NOTE: Running task 885 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_package)
NOTE: recipe libpcre2-10.39-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.39-r0: task do_package: Started
NOTE: recipe libpcre2-10.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 886 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgit2-1.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgit2-1.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 887 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_configure)
NOTE: recipe libgit2-1.4.3-r0: task do_configure: Started
NOTE: recipe libpcre2-10.39-r0: task do_package: Succeeded
NOTE: Running task 888 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_packagedata)
NOTE: recipe libpcre2-10.39-r0: task do_packagedata: Started
NOTE: recipe libgit2-1.4.3-r0: task do_configure: Succeeded
NOTE: Running task 889 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_compile)
NOTE: recipe libpcre2-10.39-r0: task do_packagedata: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_compile: Started
NOTE: recipe libgit2-1.4.3-r0: task do_compile: Succeeded
NOTE: Running task 890 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_install)
NOTE: recipe libgit2-1.4.3-r0: task do_install: Started
NOTE: recipe libgit2-1.4.3-r0: task do_install: Succeeded
NOTE: Running task 891 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_package)
NOTE: Running task 892 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_populate_sysroot)
NOTE: recipe libgit2-1.4.3-r0: task do_package: Started
NOTE: recipe libgit2-1.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe libgit2-1.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_package: Succeeded
NOTE: Running task 893 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_packagedata)
NOTE: recipe libgit2-1.4.3-r0: task do_packagedata: Started
NOTE: recipe libgit2-1.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 894 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_package_write_rpm)
NOTE: Running task 895 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_package_qa)
NOTE: recipe libgit2-1.4.3-r0: task do_package_write_rpm: Started
NOTE: recipe libgit2-1.4.3-r0: task do_package_qa: Started
NOTE: recipe libgit2-1.4.3-r0: task do_package_qa: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 896 of 896 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_build)
NOTE: Tasks Summary: Attempted 896 tasks of which 854 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-src went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-dbg went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-staticdev went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-dev went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-doc went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-locale went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-bin went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3845701348291116268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1641 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:fac000b23f8ab9d1d75c7d38f6c53a524c077ce1"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 27 Local 12 Mirrors 0 Missed 15 Current 206 (44% match, 93% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 208 of 233 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 233 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_populate_sysroot_setscene)
NOTE: Running task 703 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_fetch)
NOTE: Running task 762 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_fetch)
NOTE: Running task 768 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_fetch)
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgit2-1.4.3-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.39-r0: task do_fetch: Started
NOTE: recipe libssh2-1.10.0-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.39-r0: task do_fetch: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_fetch: Succeeded
NOTE: Running task 849 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_unpack)
NOTE: Running task 850 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 851 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_unpack)
NOTE: Running task 852 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 853 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/libcap/2.63-r0/temp/log.do_packagedata_setscene.237323
NOTE: recipe libpcre2-10.39-r0: task do_unpack: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 232 of 233 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_package_setscene)
NOTE: recipe libpcre2-10.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_unpack: Started
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_unpack: Started
NOTE: recipe libssh2-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 854 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_patch)
NOTE: recipe libpcre2-10.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_unpack: Succeeded
NOTE: Running task 855 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_patch)
NOTE: recipe libssh2-1.10.0-r0: task do_patch: Started
NOTE: recipe libpcre2-10.39-r0: task do_patch: Started
NOTE: recipe libssh2-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 856 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre2-10.39-r0: task do_patch: Succeeded
NOTE: Running task 857 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_deploy_source_date_epoch)
NOTE: recipe libssh2-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgit2-1.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 858 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_patch)
NOTE: recipe libgit2-1.4.3-r0: task do_patch: Started
NOTE: recipe libssh2-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 859 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure)
NOTE: recipe libpcre2-10.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 860 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_configure)
NOTE: recipe libgit2-1.4.3-r0: task do_patch: Succeeded
NOTE: Running task 861 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 862 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_generate_toolchain_file)
NOTE: Running task 863 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_populate_lic)
NOTE: recipe libssh2-1.10.0-r0: task do_configure: Started
NOTE: recipe libpcre2-10.39-r0: task do_configure: Started
NOTE: recipe libgit2-1.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgit2-1.4.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe libgit2-1.4.3-r0: task do_populate_lic: Started
NOTE: recipe libgit2-1.4.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_populate_lic unihash changed to 6fd9a69e62a80609710e2c36eade5cc4c89ea0bb2c6c8a4deaba2861fdadcd1c
NOTE: recipe libgit2-1.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.63-r0: task do_package_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 879 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata)
NOTE: recipe libcap-2.63-r0: task do_packagedata: Started
NOTE: recipe libcap-2.63-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_configure: Succeeded
NOTE: Running task 882 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_compile)
NOTE: recipe libpcre2-10.39-r0: task do_compile: Started
NOTE: recipe libssh2-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 883 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 884 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile)
NOTE: recipe libssh2-1.10.0-r0: task do_compile: Started
NOTE: recipe libssh2-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 885 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 886 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install)
NOTE: recipe libssh2-1.10.0-r0: task do_install: Started
NOTE: recipe libssh2-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 887 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 888 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 889 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_package)
NOTE: recipe libssh2-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_package: Started
NOTE: recipe libssh2-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 890 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_packagedata)
NOTE: recipe libpcre2-10.39-r0: task do_compile: Succeeded
NOTE: Running task 891 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_install)
NOTE: recipe libssh2-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.39-r0: task do_install: Started
NOTE: recipe libssh2-1.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_install: Succeeded
NOTE: Running task 892 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_populate_sysroot)
NOTE: Running task 893 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_package)
NOTE: recipe libpcre2-10.39-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.39-r0: task do_package: Started
NOTE: recipe libpcre2-10.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 894 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgit2-1.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgit2-1.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 895 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_configure)
NOTE: recipe libgit2-1.4.3-r0: task do_configure: Started
NOTE: recipe libpcre2-10.39-r0: task do_package: Succeeded
NOTE: Running task 896 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_packagedata)
NOTE: recipe libpcre2-10.39-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.39-r0: task do_packagedata: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_configure: Succeeded
NOTE: Running task 897 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_compile)
NOTE: recipe libgit2-1.4.3-r0: task do_compile: Started
NOTE: recipe libgit2-1.4.3-r0: task do_compile: Succeeded
NOTE: Running task 898 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_install)
NOTE: recipe libgit2-1.4.3-r0: task do_install: Started
NOTE: recipe libgit2-1.4.3-r0: task do_install: Succeeded
NOTE: Running task 899 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_package)
NOTE: Running task 900 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_populate_sysroot)
NOTE: recipe libgit2-1.4.3-r0: task do_package: Started
NOTE: recipe libgit2-1.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe libgit2-1.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_package: Succeeded
NOTE: Running task 901 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_packagedata)
NOTE: recipe libgit2-1.4.3-r0: task do_packagedata: Started
NOTE: recipe libgit2-1.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 902 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_package_write_rpm)
NOTE: Running task 903 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_package_qa)
NOTE: recipe libgit2-1.4.3-r0: task do_package_write_rpm: Started
NOTE: recipe libgit2-1.4.3-r0: task do_package_qa: Started
NOTE: recipe libgit2-1.4.3-r0: task do_package_qa: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 904 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_build)
NOTE: Tasks Summary: Attempted 904 tasks of which 862 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-src went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-dbg went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-staticdev went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-dev went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-doc went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-locale went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-bin went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3845701348291116268==
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
meta-yocto-bsp       = "tmp-auh-upgrades:fac000b23f8ab9d1d75c7d38f6c53a524c077ce1"
workspace            = "master:81b4d8bc6bdc47a731a1f7ed741d7336559a1348"

Initialising tasks...done.
Sstate summary: Wanted 27 Local 12 Mirrors 0 Missed 15 Current 206 (44% match, 93% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 208 of 233 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata_setscene)
NOTE: Running setscene task 209 of 233 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_populate_sysroot_setscene)
NOTE: Running task 703 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_fetch)
NOTE: Running task 760 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_fetch)
NOTE: Running task 768 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_fetch)
NOTE: recipe libcap-2.63-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgit2-1.4.3-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.39-r0: task do_fetch: Started
NOTE: recipe libssh2-1.10.0-r0: task do_fetch: Started
NOTE: recipe libpcre2-10.39-r0: task do_fetch: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_fetch: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_fetch: Succeeded
NOTE: Running task 849 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_unpack)
NOTE: Running task 850 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_prepare_recipe_sysroot)
NOTE: Running task 851 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_unpack)
NOTE: Running task 852 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 853 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/libcap/2.63-r0/temp/log.do_packagedata_setscene.298055
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 232 of 233 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_package_setscene)
NOTE: recipe libpcre2-10.39-r0: task do_unpack: Started
NOTE: recipe libssh2-1.10.0-r0: task do_unpack: Started
NOTE: recipe libgit2-1.4.3-r0: task do_unpack: Started
NOTE: recipe libssh2-1.10.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libpcre2-10.39-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.63-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_unpack: Succeeded
NOTE: Running task 854 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_patch)
NOTE: recipe libpcre2-10.39-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_unpack: Succeeded
NOTE: Running task 855 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_patch)
NOTE: recipe libssh2-1.10.0-r0: task do_patch: Started
NOTE: recipe libpcre2-10.39-r0: task do_patch: Started
NOTE: recipe libssh2-1.10.0-r0: task do_patch: Succeeded
NOTE: Running task 856 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpcre2-10.39-r0: task do_patch: Succeeded
NOTE: Running task 857 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_deploy_source_date_epoch)
NOTE: recipe libssh2-1.10.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libpcre2-10.39-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgit2-1.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 858 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_patch)
NOTE: recipe libgit2-1.4.3-r0: task do_patch: Started
NOTE: recipe libssh2-1.10.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 859 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure)
NOTE: recipe libpcre2-10.39-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 860 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_configure)
NOTE: recipe libgit2-1.4.3-r0: task do_patch: Succeeded
NOTE: Running task 861 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 862 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_generate_toolchain_file)
NOTE: Running task 863 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_populate_lic)
NOTE: recipe libssh2-1.10.0-r0: task do_configure: Started
NOTE: recipe libpcre2-10.39-r0: task do_configure: Started
NOTE: recipe libgit2-1.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgit2-1.4.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe libgit2-1.4.3-r0: task do_populate_lic: Started
NOTE: recipe libgit2-1.4.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_populate_lic unihash changed to 6fd9a69e62a80609710e2c36eade5cc4c89ea0bb2c6c8a4deaba2861fdadcd1c
NOTE: recipe libgit2-1.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libcap-2.63-r0: task do_package_setscene: Started
NOTE: recipe libcap-2.63-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 879 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.63.bb:do_packagedata)
NOTE: recipe libcap-2.63-r0: task do_packagedata: Started
NOTE: recipe libcap-2.63-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_configure: Succeeded
NOTE: Running task 882 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_compile)
NOTE: recipe libpcre2-10.39-r0: task do_compile: Started
NOTE: recipe libssh2-1.10.0-r0: task do_configure: Succeeded
NOTE: Running task 883 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_configure_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 884 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile)
NOTE: recipe libssh2-1.10.0-r0: task do_compile: Started
NOTE: recipe libssh2-1.10.0-r0: task do_compile: Succeeded
NOTE: Running task 885 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_compile_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 886 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install)
NOTE: recipe libssh2-1.10.0-r0: task do_install: Started
NOTE: recipe libssh2-1.10.0-r0: task do_install: Succeeded
NOTE: Running task 887 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_install_ptest_base)
NOTE: recipe libssh2-1.10.0-r0: task do_install_ptest_base: Started
NOTE: recipe libssh2-1.10.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 888 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_populate_sysroot)
NOTE: Running task 889 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_package)
NOTE: recipe libssh2-1.10.0-r0: task do_populate_sysroot: Started
NOTE: recipe libssh2-1.10.0-r0: task do_package: Started
NOTE: recipe libssh2-1.10.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libssh2-1.10.0-r0: task do_package: Succeeded
NOTE: Running task 890 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libssh2/libssh2_1.10.0.bb:do_packagedata)
NOTE: recipe libssh2-1.10.0-r0: task do_packagedata: Started
NOTE: recipe libssh2-1.10.0-r0: task do_packagedata: Succeeded
NOTE: recipe libpcre2-10.39-r0: task do_compile: Succeeded
NOTE: Running task 891 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_install)
NOTE: recipe libpcre2-10.39-r0: task do_install: Started
NOTE: recipe libpcre2-10.39-r0: task do_install: Succeeded
NOTE: Running task 892 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_populate_sysroot)
NOTE: Running task 893 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_package)
NOTE: recipe libpcre2-10.39-r0: task do_populate_sysroot: Started
NOTE: recipe libpcre2-10.39-r0: task do_package: Started
NOTE: recipe libpcre2-10.39-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 894 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgit2-1.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgit2-1.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 895 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_configure)
NOTE: recipe libgit2-1.4.3-r0: task do_configure: Started
NOTE: recipe libpcre2-10.39-r0: task do_package: Succeeded
NOTE: Running task 896 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.39.bb:do_packagedata)
NOTE: recipe libpcre2-10.39-r0: task do_packagedata: Started
NOTE: recipe libpcre2-10.39-r0: task do_packagedata: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_configure: Succeeded
NOTE: Running task 897 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_compile)
NOTE: recipe libgit2-1.4.3-r0: task do_compile: Started
NOTE: recipe libgit2-1.4.3-r0: task do_compile: Succeeded
NOTE: Running task 898 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_install)
NOTE: recipe libgit2-1.4.3-r0: task do_install: Started
NOTE: recipe libgit2-1.4.3-r0: task do_install: Succeeded
NOTE: Running task 899 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_package)
NOTE: Running task 900 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_populate_sysroot)
NOTE: recipe libgit2-1.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe libgit2-1.4.3-r0: task do_package: Started
NOTE: recipe libgit2-1.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_package: Succeeded
NOTE: Running task 901 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_packagedata)
NOTE: recipe libgit2-1.4.3-r0: task do_packagedata: Started
NOTE: recipe libgit2-1.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 902 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_package_write_rpm)
NOTE: Running task 903 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_package_qa)
NOTE: recipe libgit2-1.4.3-r0: task do_package_write_rpm: Started
NOTE: recipe libgit2-1.4.3-r0: task do_package_qa: Started
NOTE: recipe libgit2-1.4.3-r0: task do_package_qa: Succeeded
NOTE: recipe libgit2-1.4.3-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 904 of 904 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libgit2/libgit2_1.4.3.bb:do_build)
NOTE: Tasks Summary: Attempted 904 tasks of which 862 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 9 ERROR messages, returning a non-zero exit code.
/usr/lib64/python3.6/importlib/_bootstrap.py:219: ImportWarning: can't resolve package from __spec__ or __package__, falling back on __name__ and __path__
  return f(*args, **kwds)
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-src went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-dbg went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-staticdev went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-dev went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-doc went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-locale went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap-bin went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: QA Issue: Package version for package libcap went backwards which would break package feeds (from 0:2.64-r0 to 0:2.63-r0) [version-going-backwards]
ERROR: libcap-2.63-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============3845701348291116268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/libgit2: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/libgit2: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/libgit2/libgit2-dbg: PKGSIZE changed from 3815212 to 3821976 (+0%)
packages/core2-32-poky-linux/libgit2/libgit2-dbg: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/libgit2/libgit2-dbg: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/libgit2/libgit2-dbg: FILELIST: removed "/usr/lib/.debug/libgit2.so.1.4.0", added "/usr/lib/.debug/libgit2.so.1.4.3"
packages/core2-32-poky-linux/libgit2/libgit2-dev: PKGSIZE changed from 751846 to 752310 (+0%)
packages/core2-32-poky-linux/libgit2/libgit2-dev: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/libgit2/libgit2-dev: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/libgit2/libgit2-doc: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/libgit2/libgit2-doc: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/libgit2/libgit2-locale: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/libgit2/libgit2-locale: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/libgit2/libgit2-src: PKGSIZE changed from 3972953 to 3979639 (+0%)
packages/core2-32-poky-linux/libgit2/libgit2-src: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/libgit2/libgit2-src: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/libgit2/libgit2-staticdev: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/libgit2/libgit2-staticdev: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/libgit2/libgit2: PKGV changed from 1.4.2 [default] to 1.4.3 [default]
packages/core2-32-poky-linux/libgit2/libgit2: PV changed from "1.4.2" to "1.4.3"
packages/core2-32-poky-linux/libgit2/libgit2: FILELIST: removed "/usr/lib/libgit2.so.1.4.0", added "/usr/lib/libgit2.so.1.4.3"
Changes to packages/core2-32-poky-linux/libgit2 (sysroot):
  /usr/lib/libgit2.so.1.4 changed symlink target from libgit2.so.1.4.0 to libgit2.so.1.4.3
  /usr/lib/libgit2.so.1.4.0 moved to /usr/lib/libgit2.so.1.4.3

--===============3845701348291116268==--

