Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.6912.1622200976178188340
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 04:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-1.yocto.io (unknown [172.29.10.61])
	by mail.yoctoproject.org (Postfix) with ESMTP id 749FA38C13A6
	for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 11:22:55 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] vulkan-samples: upgrading to b7e55e8fcfa9fd4a8f395360873e7bbafa3705e5 FAILED
Message-ID: <MADEUP.16833731847B96BD.30906@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============8181454563476222193=="

--===============8181454563476222193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *vulkan-samples* to *b7e55e8fcfa9fd4a8f395360873e7bbafa3705e5* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade vulkan-samples -S b7e55e8fcfa9fd4a8f395360873e7bbafa3705e5
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
DISTRO_VERSION       = "3.3+snapshot-6d593da207d91e55f51bf1470321fda3780511bb"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:6d593da207d91e55f51bf1470321fda3780511bb"
workspace            = "master:40d3366bea8d2417e89a37c6f2d38e1542160342"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
ERROR: Command Error: 'sh -c 'PATCHFILE="0001-CMakeLists.txt-do-not-hardcode-lib-as-installation-t.patch" git -c user.name="OpenEmbedded" -c user.email="oe.patch@oe" commit -F /tmp/tmpjcfbk7fc --author="Alexander Kanavin <alex.kanavin@gmail.com>" --date="Sun, 1 Nov 2020 23:19:22 +0000"'' exited with 0  Output:
stdout: On branch devtool-orig
Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
  (commit or discard the untracked or modified content in submodules)
	modified:   third_party/spirv-cross (modified content)

no changes added to commit (use "git add" and/or "git commit -a")

stderr: 
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vulkan-samples/git-r0/devtooltmp-l1ywrobe/temp/log.do_patch.87149
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
ERROR: Extracting source for vulkan-samples failed



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============8181454563476222193==--
