Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.59.1594831392475965593
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 09:43:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 57F9DE01E9C; Wed, 15 Jul 2020 09:43:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE,WEIRD_PORT autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 20E16E01E9B
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 09:42:58 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnu-config: upgrading to 2593751ef276497e312d7c4ce7fd049614c7bf80 FAILED
Message-Id: <20200715164312.57F9DE01E9C@yocto-www.yoctoproject.org>
Date: Wed, 15 Jul 2020 09:43:12 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============0181701622386296617=="

--===============0181701622386296617==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnu-config* to *2593751ef276497e312d7c4ce7fd049614c7bf80* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gnu-config -S 2593751ef276497e312d7c4ce7fd049614c7bf80
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1339 entries from dependency cache.
INFO: Extracting current version source...
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20200715"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:392e4f46c5714123600387c511f5105196d450f4"
workspace            = "master:ca701cb92dcf186664d9b1f82c679e4f9cc388ec"

Initialising tasks...done.
Sstate summary: Wanted 8 Found 0 Missed 8 Current 12 (0% match, 60% complete)
NOTE: Executing Tasks
ERROR: Command '['rm', '-rf', '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20200621+gitAUTOINC+696cd4a4ea-r0/devtooltmp-h6667x76/workdir/git']' returned non-zero exit status 1.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20200621+gitAUTOINC+696cd4a4ea-r0/devtooltmp-h6667x76/temp/log.do_unpack.24531
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; unset _PYTHON_SYSCONFIGDATA_NAME; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20200621+gitAUTOINC+696cd4a4ea-r0/devtooltmp-h6667x76/workdir/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20200621+gitAUTOINC+696cd4a4ea-r0/devtooltmp-h6667x76/workdir/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20200621+gitAUTOINC+696cd4a4ea-r0/devtooltmp-h6667x76/workdir/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-64-poky-linux/gnu-config/20200621+gitAUTOINC+696cd4a4ea-r0/devtooltmp-h6667x76/workdir/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20200621+gitAUTOINC+696cd4a4ea-r0/devtooltmp-h6667x76/workdir/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20200621+gitAUTOINC+696cd4a4ea-r0/devtooltmp-h6667x76/workdir/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; git -c core.fsyncobjectfiles=0 branch master --set-upstream-to origin/master failed with exit code 128, output:
fatal: not a git repository (or any of the parent directories): .git

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20200621+gitAUTOINC+696cd4a4ea-r0/devtooltmp-h6667x76/temp/log.do_unpack.24527
Log data follows:
| rm: cannot remove '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20200621+gitAUTOINC+696cd4a4ea-r0/devtooltmp-h6667x76/workdir/git/.git': Directory not empty
| ERROR: Command '['rm', '-rf', '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20200621+gitAUTOINC+696cd4a4ea-r0/devtooltmp-h6667x76/workdir/git']' returned non-zero exit status 1.
NOTE: Tasks Summary: Attempted 56 tasks of which 51 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds
ERROR: Extracting source for gnu-config failed



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============0181701622386296617==--
