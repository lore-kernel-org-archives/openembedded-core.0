Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.16613.1598724136986026445
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2020 11:02:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D16F4E020D3; Sat, 29 Aug 2020 11:02:16 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE,WEIRD_PORT autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 WEIRD_PORT URI: Uses non-standard port number for HTTP
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.0 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.113] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 31C2AE020D0
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2020 11:01:57 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gnu-config: upgrading to 0b5188819ba6091770064adf26360b204113317e FAILED
Message-Id: <20200829180216.D16F4E020D3@yocto-www.yoctoproject.org>
Date: Sat, 29 Aug 2020 11:02:16 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============0173206460177344197=="

--===============0173206460177344197==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gnu-config* to *0b5188819ba6091770064adf26360b204113317e* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade gnu-config -S 0b5188819ba6091770064adf26360b204113317e
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1341 entries from dependency cache.
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
DISTRO_VERSION       = "3.1+snapshot-20200829"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6848c6390075c246fd9ae1f3f3e911c821f1c630"
workspace            = "master:104ff3c834d9ea60de4600fca374c0bdc9ca843d"

Initialising tasks...done.
Sstate summary: Wanted 8 Found 0 Missed 8 Current 12 (0% match, 60% complete)
NOTE: Executing Tasks
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; unset _PYTHON_SYSCONFIGDATA_NAME; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20200721+gitAUTOINC+2593751ef2-r0/devtooltmp-e7bgwi76/workdir/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20200721+gitAUTOINC+2593751ef2-r0/devtooltmp-e7bgwi76/workdir/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20200721+gitAUTOINC+2593751ef2-r0/devtooltmp-e7bgwi76/workdir/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/w
 ork/core2-64-poky-linux/gnu-config/20200721+gitAUTOINC+2593751ef2-r0/devtooltmp-e7bgwi76/workdir/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20200721+gitAUTOINC+2593751ef2-r0/devtooltmp-e7bgwi76/workdir/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20200721+gitAUTOINC+2593751ef2-r0/devtooltmp-e7bgwi76/workdir/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; git -c core.fsyncobjectfiles=0 remote set-url origin git://git.savannah.gnu.org/config.git failed with exit code 128, output:
fatal: not a git repository (or any of the parent directories): .git

ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/gnu-config/20200721+gitAUTOINC+2593751ef2-r0/devtooltmp-e7bgwi76/temp/log.do_unpack.31886
NOTE: Tasks Summary: Attempted 56 tasks of which 51 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds
ERROR: Extracting source for gnu-config failed



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============0173206460177344197==--
