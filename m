Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.16426.1623585061922361329
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Jun 2021 04:51:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 82FB038C140B
	for <openembedded-core@lists.openembedded.org>; Sun, 13 Jun 2021 11:51:01 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to 47c5237be21209afc945e43d03ae409fa80a0155 FAILED
Message-ID: <MADEUP.1688220306A24B6F.15968@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============6337422189564601670=="

--===============6337422189564601670==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *47c5237be21209afc945e43d03ae409fa80a0155* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S 47c5237be21209afc945e43d03ae409fa80a0155
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1454 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-f4182dcfd8c5683bd2cb43a30d743daf16789f63"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:f4182dcfd8c5683bd2cb43a30d743daf16789f63"
workspace            = "master:29c42cf24da05abb499936556dad1902e110c5a7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
ERROR: Command Error: 'sh -c 'PATCHFILE="0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch" git -c user.name="OpenEmbedded" -c user.email="oe.patch@oe" commit -F /tmp/tmpwqkt3jde --author="Alexander Kanavin <alex.kanavin@gmail.com>" --date="Sun, 1 Nov 2020 23:19:22 +0000"'' exited with 0  Output:
stdout: On branch devtool-orig
Changes not staged for commit:
	modified:   third_party/spirv-cross (modified content)

no changes added to commit

stderr: 
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vulkan-samples/git-r0/devtooltmp-4s9z4h3h/temp/log.do_patch.4839
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
ERROR: Extracting source for vulkan-samples failed



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============6337422189564601670==--
