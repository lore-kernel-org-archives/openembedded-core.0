Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.688.1610713822595446391
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id E70AC38C1241
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:21 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] autoconf: upgrading to 2.70 FAILED
Message-ID: <MADEUP.165A67B015014023.32579@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============2958317574461821173=="

--===============2958317574461821173==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *autoconf* to *2.70* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade autoconf -V 2.70
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry...
NOTE: Retrying server connection (#2)...
Loading cache...done.
Loaded 1420 entries from dependency cache.
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-d1e0be6f41bf97bd6bd39fe5b09a3c200ad6246a"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d1e0be6f41bf97bd6bd39fe5b09a3c200ad6246a"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 6 Found 0 Missed 6 Current 14 (0% match, 70% complete)
NOTE: Executing Tasks
ERROR: Command '['rm', '-rf', '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/autoconf/2.69-r11/devtooltmp-4p9j9t03/workdir/autoconf-2.69']' returned non-zero exit status 1.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/autoconf/2.69-r11/devtooltmp-4p9j9t03/temp/log.do_unpack.2746610
Log data follows:
| rm: cannot remove '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/autoconf/2.69-r11/devtooltmp-4p9j9t03/workdir/autoconf-2.69/build-aux': Directory not empty
| ERROR: Command '['rm', '-rf', '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/autoconf/2.69-r11/devtooltmp-4p9j9t03/workdir/autoconf-2.69']' returned non-zero exit status 1.
NOTE: Tasks Summary: Attempted 66 tasks of which 61 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds
ERROR: Extracting source for autoconf failed



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============2958317574461821173==--
