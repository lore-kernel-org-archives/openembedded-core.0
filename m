Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.720.1610713822581751963
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:22 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id D97BA38C1238
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:21 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Andrej Valek <andrej.valek@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] busybox: upgrading to 1.33.0 FAILED
Message-ID: <MADEUP.165A67B0138E21F6.6799@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============6209092930270099263=="

--===============6209092930270099263==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *busybox* to *1.33.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe busybox failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1420 entries from dependency cache.
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-cf490d04b5a7604512284d9cd4bad0ee07d4156d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cf490d04b5a7604512284d9cd4bad0ee07d4156d"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://busybox.net/downloads/busybox-1.33.0.tar.bz2;name=tarball...
Loading cache...done.
Loaded 1420 entries from dependency cache.
Parsing recipes...done.
Parsing of 811 .bb files complete (809 cached, 2 parsed). 1421 targets, 33 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-cf490d04b5a7604512284d9cd4bad0ee07d4156d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:cf490d04b5a7604512284d9cd4bad0ee07d4156d"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  26% |#########                           | ETA:  0:00:00
Adding changed files:  53% |###################                 | ETA:  0:00:00
Adding changed files:  80% |############################        | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
WARNING: Command 'git rebase 5089059bdb93a73efe3ad18627ddbbdaa2fe7bd4' failed:
Rebasing (1/11)
Rebasing (2/11)
Rebasing (3/11)
Rebasing (4/11)
Rebasing (5/11)
Rebasing (6/11)
Rebasing (7/11)
Rebasing (8/11)
Rebasing (9/11)
Rebasing (10/11)
Rebasing (11/11)
error: could not apply 82e2d42... hwclock: make glibc 2.31 compatible
Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".
Could not apply 82e2d42... hwclock: make glibc 2.31 compatible
Auto-merging util-linux/hwclock.c
CONFLICT (content): Merge conflict in util-linux/hwclock.c

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/busybox
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/busybox/busybox_1.33.0.bb




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============6209092930270099263==--
