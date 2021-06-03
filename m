Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.2168.1622683485305380270
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 18:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7926438C1106
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Jun 2021 01:24:44 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnu-config: upgrading to 4550d2f15b3a7ce2451c1f29500b9339430c877f FAILED
Message-ID: <MADEUP.1684EE085AA11C0A.6146@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============2698358079603857372=="

--===============2698358079603857372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnu-config* to *4550d2f15b3a7ce2451c1f29500b9339430c877f* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gnu-config -S 4550d2f15b3a7ce2451c1f29500b9339430c877f
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1459 entries from dependency cache.
INFO: Extracting current version source...
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-69110d441fe878a6425133a9f66bf9f312fff649"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:69110d441fe878a6425133a9f66bf9f312fff649"
workspace            = "master:9d1b332292a94cd4463f1e88dfe293847264714e"

Initialising tasks...done.
Sstate summary: Wanted 8 Local 0 Network 0 Missed 8 Current 12 (0% match, 60% complete)
Removing 6 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
WARNING: No source unpacked to S - either the gnu-config recipe doesn't use any source or the correct source directory could not be determined
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/native-intercept:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20210522+gitAUTOINC+92fac9b5ce-r0/devtooltmp-92rinwqs/workdir/recipe-sysroot-native/usr/bin/x86_64-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20210522+gitAUTOINC+92fac9b5ce-r0/devtooltmp-92rinwqs/workdir/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20210522+gitAUTOINC+92fac9b5ce-r0/devtooltmp-92rinwqs/workdir/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/b
 uild/build/build/tmp/work/core2-64-poky-linux/gnu-config/20210522+gitAUTOINC+92fac9b5ce-r0/devtooltmp-92rinwqs/workdir/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20210522+gitAUTOINC+92fac9b5ce-r0/devtooltmp-92rinwqs/workdir/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20210522+gitAUTOINC+92fac9b5ce-r0/devtooltmp-92rinwqs/workdir/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; git -c core.fsyncobjectfiles=0 clone -n -s /home/pokybuild/yocto-worker/auh/build/build/build/downloads/git2/git.savannah.gnu.org.config.git/ /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20210522+gitAUTOINC+92fac9b5ce-r0/devtooltmp-92rinwqs/workdir/git/ failed with exit code 128, ou
 tput:
fatal: destination path '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20210522+gitAUTOINC+92fac9b5ce-r0/devtooltmp-92rinwqs/workdir/git' already exists and is not an empty directory.

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20210522+gitAUTOINC+92fac9b5ce-r0/devtooltmp-92rinwqs/temp/log.do_unpack.41912
NOTE: Tasks Summary: Attempted 56 tasks of which 51 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds
ERROR: Extracting source for gnu-config failed



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============2698358079603857372==--
