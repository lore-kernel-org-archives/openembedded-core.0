Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.13212.1626600381831147846
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Jul 2021 02:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0A68738C094A
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Jul 2021 09:26:21 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] systemd-boot: upgrading to 249 FAILED
Message-ID: <MADEUP.1692D86DE5C9757E.27710@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============0470901891925496007=="

--===============0470901891925496007==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *systemd-boot* to *249* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade systemd-boot -V 249 -S f6278558da0304ec6b646bb172ce4688c7f162a5
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
DISTRO_VERSION       = "3.3+snapshot-84fbf8632d78afa82d04d39cb89c19b822849dfb"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:84fbf8632d78afa82d04d39cb89c19b822849dfb"
workspace            = "master:84fbf8632d78afa82d04d39cb89c19b822849dfb"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds
INFO: Extracting upgraded version source...
ERROR: Revision f6278558da0304ec6b646bb172ce4688c7f162a5 was found on multiple branches: 
  main
  v249-stable
Please provide the correct branch in the devtool command with "--srcbranch" or "-B" option.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============0470901891925496007==--
