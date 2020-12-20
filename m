Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.23886.1608473714255479553
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Dec 2020 06:15:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-3.yocto.io (unknown [172.29.10.57])
	by mail.yoctoproject.org (Postfix) with ESMTP id 3087A38C13C0
	for <openembedded-core@lists.openembedded.org>; Sun, 20 Dec 2020 14:15:15 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to fdc8fab1a520df5566de3eda7b526b24f04e6379 FAILED
Message-ID: <MADEUP.16527252B87B1A6D.27420@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============7342440762758964831=="

--===============7342440762758964831==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *fdc8fab1a520df5566de3eda7b526b24f04e6379* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S fdc8fab1a520df5566de3eda7b526b24f04e6379
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1416 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-4021d01fe283abd9054958e230f94036b23f6dd9"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4021d01fe283abd9054958e230f94036b23f6dd9"
workspace            = "master-next:afec39415be67b6985f0a0c3de041b4f302ffff3"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
ERROR: Command Error: 'sh -c 'PATCHFILE="0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch" git -c user.name="OpenEmbedded" -c user.email="oe.patch@oe" commit -F /tmp/tmplmyatxob --author="Alexander Kanavin <alex.kanavin@gmail.com>" --date="Sun, 1 Nov 2020 23:19:22 +0000"'' exited with 0  Output:
On branch devtool-orig
Changes not staged for commit:
	modified:   third_party/spirv-cross (modified content)

no changes added to commit
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vulkan-samples/git-r0/devtooltmp-pe8_z5n0/temp/log.do_patch.47581
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
ERROR: Extracting source for vulkan-samples failed



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============7342440762758964831==--
