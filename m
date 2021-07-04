Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.7614.1625391858167817024
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jul 2021 02:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-1.yocto.io (unknown [172.29.10.55])
	by mail.yoctoproject.org (Postfix) with ESMTP id 951A538C1110
	for <openembedded-core@lists.openembedded.org>; Sun,  4 Jul 2021 09:44:17 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnu-config: upgrading to 45e181800a6a27268a9c5d79dcc60492fef9a9a0 FAILED
Message-ID: <MADEUP.168E8D488E8C1799.9961@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============6633420176167500170=="

--===============6633420176167500170==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnu-config* to *45e181800a6a27268a9c5d79dcc60492fef9a9a0* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gnu-config -S 45e181800a6a27268a9c5d79dcc60492fef9a9a0
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1455 entries from dependency cache.
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
DISTRO_VERSION       = "3.3+snapshot-f66b63e3c9e8c2410277d2a884e123507f30bb9a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f66b63e3c9e8c2410277d2a884e123507f30bb9a"
workspace            = "master:be1cf223bf9c514ee81820ded5b13318458c0daf"

Initialising tasks...done.
Sstate summary: Wanted 8 Local 0 Network 0 Missed 8 Current 12 (0% match, 60% complete)
Removing 6 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20210620+gitAUTOINC+4550d2f15b-r0/devtooltmp-vkqks4ai/workdir/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20210620+gitAUTOINC+4550d2f15b-r0/devtooltmp-vkqks4ai/workdir/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20210620+gitAUTOINC+4550d2f15b-r0/devtooltmp-vkqks4ai/workdir/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/2021062
 0+gitAUTOINC+4550d2f15b-r0/devtooltmp-vkqks4ai/workdir/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20210620+gitAUTOINC+4550d2f15b-r0/devtooltmp-vkqks4ai/workdir/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20210620+gitAUTOINC+4550d2f15b-r0/devtooltmp-vkqks4ai/workdir/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; git -c core.fsyncobjectfiles=0 checkout -B master 4550d2f15b3a7ce2451c1f29500b9339430c877f failed with exit code 128, output:
fatal: not a git repository (or any of the parent directories): .git

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20210620+gitAUTOINC+4550d2f15b-r0/devtooltmp-vkqks4ai/temp/log.do_unpack.55820
NOTE: Tasks Summary: Attempted 56 tasks of which 51 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
ERROR: Extracting source for gnu-config failed



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============6633420176167500170==--
