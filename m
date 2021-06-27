Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.5774.1624805202718703933
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 07:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [127.0.1.1] (unknown [172.29.10.115])
	by mail.yoctoproject.org (Postfix) with ESMTP id 07EA038C12A4
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 14:46:42 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to b3e8d49dcc2f94f4a14cafb64f02d1dca71c9565 FAILED
Message-ID: <MADEUP.168C77B92FDDB45F.8895@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============2511639847433313821=="

--===============2511639847433313821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *b3e8d49dcc2f94f4a14cafb64f02d1dca71c9565* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S b3e8d49dcc2f94f4a14cafb64f02d1dca71c9565
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1455 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-2d6ba0911668c530c215d0b7db11b8eff5fab02c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2d6ba0911668c530c215d0b7db11b8eff5fab02c"
workspace            = "master:3ea3e3435fc7d94e6eb04cf9cd9f66ee946f6af6"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
ERROR: Command Error: 'sh -c 'PATCHFILE="0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch" git -c user.name="OpenEmbedded" -c user.email="oe.patch@oe" commit -F /tmp/tmprcays2j8 --author="Alexander Kanavin <alex.kanavin@gmail.com>" --date="Sun, 1 Nov 2020 23:19:22 +0000"'' exited with 0  Output:
stdout: On branch devtool-orig
Changes not staged for commit:
	modified:   third_party/spirv-cross (modified content)

no changes added to commit

stderr: 
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vulkan-samples/git-r0/devtooltmp-b2_6sd1u/temp/log.do_patch.20252
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
ERROR: Extracting source for vulkan-samples failed



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============2511639847433313821==--
