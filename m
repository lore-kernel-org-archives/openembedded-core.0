Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.5902.1626056248623376533
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 19:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8F8BD38C1297
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 02:17:27 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] xserver-xorg: upgrading to 1.20.12 FAILED
Message-ID: <MADEUP.1690E98B23C348A1.22557@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============5978492454294575711=="

--===============5978492454294575711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *xserver-xorg* to *1.20.12* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade xserver-xorg -V 1.20.12
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1458 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-3c06c47594f4a1ffb50608233cd613c23d3254d0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3c06c47594f4a1ffb50608233cd613c23d3254d0"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting upgraded version source...
INFO: Fetching https://www.x.org/releases//individual/xserver/xorg-server-1.20.12.tar.bz2...
Loading cache...done.
Loaded 1458 entries from dependency cache.
Parsing recipes...done.
Parsing of 822 .bb files complete (820 cached, 2 parsed). 1459 targets, 34 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-3c06c47594f4a1ffb50608233cd613c23d3254d0"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3c06c47594f4a1ffb50608233cd613c23d3254d0"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
WARNING: Failed to fetch URL https://www.x.org/releases//individual/xserver/xorg-server-1.20.12.tar.bz2, attempting MIRRORS if available
ERROR: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; export ftp_proxy="http://proxy.yocto.io:5187/"; export FTP_PROXY="http://proxy.yocto.io:5187/"; export PATH="/home/pokybuild/yocto-worker/auh/build/build/build/tmp/sysroots-uninative/x86_64-linux/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/scripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-drjqo3xb/work/recipe-sysroot-native/usr/bin/x86_64-poky-linux:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-drjqo3xb/work/recipe-sysroot/usr/bin/crossscripts:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-drjqo3xb/work/recipe-sysroot-native/usr/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-drjqo3xb/work/recipe-sysroot-native/usr/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-drjqo3xb/work/recipe-sysroot-native/sbin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-drjq
 o3xb/work/recipe-sysroot-native/bin:/home/pokybuild/yocto-worker/auh/build/build/poky/bitbake/bin:/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools"; export HOME="/home/pokybuild"; /usr/bin/env wget -t 2 -T 30 --passive-ftp --no-check-certificate -P /home/pokybuild/yocto-worker/auh/build/build/build/downloads 'https://www.x.org/releases//individual/xserver/xorg-server-1.20.12.tar.bz2' --progress=dot -v failed with exit code 8, output:
--2021-07-11 20:42:21--  https://www.x.org/releases//individual/xserver/xorg-server-1.20.12.tar.bz2
Resolving www.x.org (www.x.org)... 2610:10:20:722:a800:ff:feda:470f, 131.252.210.176
Connecting to www.x.org (www.x.org)|2610:10:20:722:a800:ff:feda:470f|:443... connected.
HTTP request sent, awaiting response... 404 Not Found
2021-07-11 20:42:21 ERROR 404: Not Found.


ERROR: Fetcher failure for URL: 'https://www.x.org/releases//individual/xserver/xorg-server-1.20.12.tar.bz2'. Unable to fetch URL from any source.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/recipetool-drjqo3xb/work/temp/log.do_fetch.36696
NOTE: Tasks Summary: Attempted 1 tasks of which 0 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
ERROR: Failed to fetch URL https://www.x.org/releases//individual/xserver/xorg-server-1.20.12.tar.bz2



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============5978492454294575711==--
