Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.5211.1613463848578057905
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id D019038C112E
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:10 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] go-helloworld: upgrading to bcf50bfd7dcd8020c90965747d857ae42802e0c5 FAILED
Message-ID: <MADEUP.16642CD2F286A213.16989@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============0822208103801171864=="

--===============0822208103801171864==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *go-helloworld* to *bcf50bfd7dcd8020c90965747d857ae42802e0c5* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade go-helloworld -S bcf50bfd7dcd8020c90965747d857ae42802e0c5
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1428 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-d7f85ed7e011dd4d0f4b2cf48296bdf0dc7098da"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:d7f85ed7e011dd4d0f4b2cf48296bdf0dc7098da"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting upgraded version source...
ERROR: Execution of 'git checkout bcf50bfd7dcd8020c90965747d857ae42802e0c5' failed with exit code 128:
fatal: reference is not a tree: bcf50bfd7dcd8020c90965747d857ae42802e0c5




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============0822208103801171864==--
