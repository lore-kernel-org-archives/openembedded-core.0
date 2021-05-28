Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.6935.1622200976348709543
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 04:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6163938C137A
	for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 11:22:55 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to 09c3a5e06b5dbcbe35b7c0861f91088f47c02ac4 FAILED
Message-ID: <MADEUP.168337317F67E12E.30906@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============1319091242997763217=="

--===============1319091242997763217==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-helloworld* to *09c3a5e06b5dbcbe35b7c0861f91088f47c02ac4* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S 09c3a5e06b5dbcbe35b7c0861f91088f47c02ac4
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1456 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-301cd99a0246d9d34d336a90a84475511e4cd351"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:301cd99a0246d9d34d336a90a84475511e4cd351"
workspace            = "master:40d3366bea8d2417e89a37c6f2d38e1542160342"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 09c3a5e06b5dbcbe35b7c0861f91088f47c02ac4' failed with exit code 128:
fatal: reference is not a tree: 09c3a5e06b5dbcbe35b7c0861f91088f47c02ac4




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============1319091242997763217==--
