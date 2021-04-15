Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.1333.1618510600781612472
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6F60F38C0921
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:38 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] u-boot-tools: upgrading to 2021.04 FAILED
Message-ID: <MADEUP.16761AD10429F4DA.4047@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============0736526553784449336=="

--===============0736526553784449336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *u-boot-tools* to *2021.04* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe u-boot-tools failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1438 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:aa0116db4c95157e11a4e2ad0b6dd564b9f35ca0"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds
INFO: Extracting upgraded version source...
WARNING: Command 'git rebase b46dd116ce03e235f2a7d4843c6278e1da44b5e1' failed:
Rebasing (1/3)
error: could not apply 0539677a76... image: Adjust the workings of fit_check_format()
Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".
Could not apply 0539677a76... image: Adjust the workings of fit_check_format()
Auto-merging include/image.h
CONFLICT (content): Merge conflict in include/image.h
Auto-merging drivers/net/fsl-mc/mc.c
Auto-merging drivers/fpga/socfpga_arria10.c
Auto-merging common/splash_source.c
Auto-merging common/image-fit.c
CONFLICT (content): Merge conflict in common/image-fit.c
Auto-merging common/image-fdt.c
Auto-merging cmd/disk.c
Auto-merging cmd/bootm.c
Auto-merging arch/arm/cpu/armv8/sec_firmware.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/u-boot-tools
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/u-boot-tools/u-boot-tools_2021.04.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============0736526553784449336==--
