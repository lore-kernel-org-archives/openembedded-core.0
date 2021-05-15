Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.4571.1621074783972108535
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4F20238C13A9
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu: upgrading to 6.0.0 FAILED
Message-ID: <MADEUP.167F36ED6B574696.3509@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============8660934237956234978=="

--===============8660934237956234978==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *qemu* to *6.0.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe qemu failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1459 entries from dependency cache.
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-adba9869854dc60a21edbc90f1578bf4b11a8ccb"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:adba9869854dc60a21edbc90f1578bf4b11a8ccb"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://download.qemu.org/qemu-6.0.0.tar.xz...
Loading cache...done.
Loaded 1459 entries from dependency cache.
Parsing recipes...done.
Parsing of 826 .bb files complete (824 cached, 2 parsed). 1460 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-adba9869854dc60a21edbc90f1578bf4b11a8ccb"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:adba9869854dc60a21edbc90f1578bf4b11a8ccb"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   3% |#                                   | ETA:  0:00:08
Adding changed files:   6% |##                                  | ETA:  0:00:06
Adding changed files:   9% |###                                 | ETA:  0:00:05
Adding changed files:  12% |####                                | ETA:  0:00:04
Adding changed files:  15% |#####                               | ETA:  0:00:04
Adding changed files:  18% |######                              | ETA:  0:00:04
Adding changed files:  21% |#######                             | ETA:  0:00:04
Adding changed files:  24% |########                            | ETA:  0:00:04
Adding changed files:  28% |##########                          | ETA:  0:00:03
Adding changed files:  31% |###########                         | ETA:  0:00:03
Adding changed files:  34% |############                        | ETA:  0:00:03
Adding changed files:  37% |#############                       | ETA:  0:00:03
Adding changed files:  40% |##############                      | ETA:  0:00:03
Adding changed files:  43% |###############                     | ETA:  0:00:03
Adding changed files:  46% |################                    | ETA:  0:00:02
Adding changed files:  49% |#################                   | ETA:  0:00:02
Adding changed files:  52% |###################                 | ETA:  0:00:02
Adding changed files:  56% |####################                | ETA:  0:00:02
Adding changed files:  59% |#####################               | ETA:  0:00:02
Adding changed files:  62% |######################              | ETA:  0:00:02
Adding changed files:  65% |#######################             | ETA:  0:00:01
Adding changed files:  68% |########################            | ETA:  0:00:01
Adding changed files:  71% |#########################           | ETA:  0:00:01
Adding changed files:  74% |##########################          | ETA:  0:00:01
Adding changed files:  77% |############################        | ETA:  0:00:01
Adding changed files:  80% |#############################       | ETA:  0:00:01
Adding changed files:  84% |##############################      | ETA:  0:00:00
Adding changed files:  87% |###############################     | ETA:  0:00:00
Adding changed files:  90% |################################    | ETA:  0:00:00
Adding changed files:  93% |#################################   | ETA:  0:00:00
Adding changed files:  96% |##################################  | ETA:  0:00:00
Adding changed files:  99% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:05
WARNING: Command 'git rebase 692ec00a46ab16755ea0bacd1a5b3f54e1d18b6e' failed:
Rebasing (1/42)
Rebasing (2/42)
Rebasing (3/42)
Rebasing (4/42)
Rebasing (5/42)
Rebasing (6/42)
Rebasing (7/42)
error: could not apply 2436ae8... Add enable/disable libudev
Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".
Could not apply 2436ae8... Add enable/disable libudev
Auto-merging configure
CONFLICT (content): Merge conflict in configure

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/qemu
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/qemu/qemu_6.0.0.bb




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============8660934237956234978==--
