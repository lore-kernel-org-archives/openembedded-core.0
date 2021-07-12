Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.5888.1626056248347432763
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 19:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 3BABA38C117B
	for <openembedded-core@lists.openembedded.org>; Mon, 12 Jul 2021 02:17:27 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libuv: upgrading to 1.41.1 FAILED
Message-ID: <MADEUP.1690E98AF3A274DF.22557@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============0624640916815406006=="

--===============0624640916815406006==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libuv* to *1.41.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade libuv -V 1.41.1 -S 8c438ced8f36e787280800e94c21a82560219a1c
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
DISTRO_VERSION       = "3.3+snapshot-c88cf281778453f85c7d2f3392babe7ee8ab199d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c88cf281778453f85c7d2f3392babe7ee8ab199d"
workspace            = "master:aa26842ec3d25094636979a3283f2236c582b747"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout 8c438ced8f36e787280800e94c21a82560219a1c' failed with exit code 128:
fatal: reference is not a tree: 8c438ced8f36e787280800e94c21a82560219a1c




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============0624640916815406006==--
