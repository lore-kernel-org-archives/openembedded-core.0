Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.23886.1608473714255479553
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id A494C38C13C6
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:13 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] automake: upgrading to 1.16.3 FAILED
Message-ID: <MADEUP.165272523675D8FE.5278@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============7750173574038454739=="

--===============7750173574038454739==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *automake* to *1.16.3* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade automake -V 1.16.3
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1413 entries from dependency cache.
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
DISTRO_VERSION       = "3.2+snapshot-732f63b4251fdc4da9d4ef94f99de72e37ca2029"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:732f63b4251fdc4da9d4ef94f99de72e37ca2029"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 5 Found 0 Missed 5 Current 15 (0% match, 75% complete)
NOTE: Executing Tasks
ERROR: Command '['rm', '-rf', '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/automake/1.16.2-r0/devtooltmp-e93f45uq/workdir/automake-1.16.2']' returned non-zero exit status 1.
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/automake/1.16.2-r0/devtooltmp-e93f45uq/temp/log.do_unpack.31793
Log data follows:
| rm: cannot remove '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/automake/1.16.2-r0/devtooltmp-e93f45uq/workdir/automake-1.16.2': Directory not empty
| ERROR: Command '['rm', '-rf', '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/automake/1.16.2-r0/devtooltmp-e93f45uq/workdir/automake-1.16.2']' returned non-zero exit status 1.
NOTE: Tasks Summary: Attempted 71 tasks of which 66 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
ERROR: Extracting source for automake failed



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============7750173574038454739==--
