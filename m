Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.4566.1621074783111841676
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 1E3D238C124A
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:02 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Marek Vasut <marek.vasut@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] u-boot: upgrading to 2021.04 FAILED
Message-ID: <MADEUP.167F36ED3149168C.3509@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============7879040586149887490=="

--===============7879040586149887490==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *u-boot* to *2021.04* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe u-boot failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1459 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-ed2e3b739a7e0e8daad665fed01342d60674d6b7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ed2e3b739a7e0e8daad665fed01342d60674d6b7"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds
INFO: Extracting upgraded version source...
WARNING: Command 'git rebase b46dd116ce03e235f2a7d4843c6278e1da44b5e1' failed:
Rebasing (1/4)
error: could not apply 46ad2dc398... image: Adjust the workings of fit_check_format()
Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".
Could not apply 46ad2dc398... image: Adjust the workings of fit_check_format()
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
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/u-boot
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/u-boot/u-boot_2021.04.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============7879040586149887490==--
