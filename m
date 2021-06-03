Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.2085.1622683485042189233
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jun 2021 18:24:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0189D38C08C0
	for <openembedded-core@lists.openembedded.org>; Thu,  3 Jun 2021 01:24:44 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ovmf: upgrading to edk2-stable202105 FAILED
Message-ID: <MADEUP.1684EE084C516078.31310@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============2533925569407330909=="

--===============2533925569407330909==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ovmf* to *edk2-stable202105* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade ovmf -V edk2-stable202105 -S e1999b264f1f9d7230edf2448f757c73da567832
NOTE: Starting bitbake server...
INFO: Creating workspace layer in /home/pokybuild/yocto-worker/auh/build/build/build/workspace
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 823 .bb files complete (0 cached, 823 parsed). 1459 targets, 31 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "3.3+snapshot-9d1b332292a94cd4463f1e88dfe293847264714e"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9d1b332292a94cd4463f1e88dfe293847264714e"
workspace            = "master:9d1b332292a94cd4463f1e88dfe293847264714e"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
ERROR: Command Error: 'sh -c 'PATCHFILE="0001-Fix-VLA-parameter-warning.patch" git -c user.name="OpenEmbedded" -c user.email="oe.patch@oe" commit -F /tmp/tmp0rmunig0 --author="Adrian Herrera <adr.her.arc.95@gmail.com>" --date="Mon, 22 Mar 2021 21:06:47 +0000"'' exited with 0  Output:
stdout: On branch devtool-orig
Changes not staged for commit:
	modified:   BaseTools/Source/C/BrotliCompress/brotli (modified content)

no changes added to commit

stderr: 
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/ovmf/edk2-stable202102-r0/devtooltmp-4u9bjpdh/temp/log.do_patch.13200
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
ERROR: Extracting source for ovmf failed



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============2533925569407330909==--
