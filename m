Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.39492.1605551303737446197
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 1890E38C1124
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnu-config: upgrading to 77632d92f25e26b95c64afd3700d51bd03587613 FAILED
Message-ID: <MADEUP.164810677F0B1E99.12355@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============5326931347498076202=="

--===============5326931347498076202==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnu-config* to *77632d92f25e26b95c64afd3700d51bd03587613* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gnu-config -S 77632d92f25e26b95c64afd3700d51bd03587613
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1392 entries from dependency cache.
INFO: Extracting current version source...
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:25f55a00f4ca4eb6338956e0684a2253d5a32012"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 8 Found 0 Missed 8 Current 12 (0% match, 60% complete)
NOTE: Executing Tasks
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; unset _PYTHON_SYSCONFIGDATA_NAME; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20201018+gitAUTOINC+664b772118-r0/devtooltmp-jfir0x2w/workdir/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20201018+gitAUTOINC+664b772118-r0/devtooltmp-jfir0x2w/workdir/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20201018+gitAUTOINC+664b772118-r0/devtooltmp-jfir0x2w/workdir/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core
 2-64-poky-linux/gnu-config/20201018+gitAUTOINC+664b772118-r0/devtooltmp-jfir0x2w/workdir/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20201018+gitAUTOINC+664b772118-r0/devtooltmp-jfir0x2w/workdir/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20201018+gitAUTOINC+664b772118-r0/devtooltmp-jfir0x2w/workdir/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; git -c core.fsyncobjectfiles=0 branch master --set-upstream-to origin/master failed with exit code 128, output:
fatal: not a git repository (or any of the parent directories): .git

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20201018+gitAUTOINC+664b772118-r0/devtooltmp-jfir0x2w/temp/log.do_unpack.47938
NOTE: Tasks Summary: Attempted 56 tasks of which 51 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
ERROR: Extracting source for gnu-config failed



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============5326931347498076202==--
