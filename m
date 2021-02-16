Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.5168.1613463848181056112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 3561638C0949
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:07 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Andrej Valek <andrej.valek@siemens.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] busybox: upgrading to 1.33.0 FAILED
Message-ID: <MADEUP.16642CD2504DDD47.5617@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============0145801686874782157=="

--===============0145801686874782157==
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
Loaded 1425 entries from dependency cache.
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-8656105cb5c16cbf95c8d49202ad23f4bb15933f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8656105cb5c16cbf95c8d49202ad23f4bb15933f"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

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
Loaded 1425 entries from dependency cache.
Parsing recipes...done.
Parsing of 810 .bb files complete (808 cached, 2 parsed). 1426 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-8656105cb5c16cbf95c8d49202ad23f4bb15933f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8656105cb5c16cbf95c8d49202ad23f4bb15933f"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

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
WARNING: Command 'git rebase 5e7d8589e8cd25d948c6e379ea0c3a3881d0e013' failed:
First, rewinding head to replay your work on top of it...
Applying: busybox-udhcpc-no_deconfig.patch
Applying: busybox: fail on no media
Applying: This adds connmand to the list of know dhcp clients
Applying: menuconfig,check-lxdiaglog.sh: Allow specification of ncurses location
Applying: Use $(CC) when linking instead of $(LD) and use $(CFLAGS) and $(EXTRA_CFLAGS) when linking.
Applying: busybox: Avoid race building libbb
Applying: testsuite: check uudecode before using it
Applying: testsuite: use www.example.org for wget test cases
Applying: du-l-works: fix to use 145 instead of 144
Applying: sysctl: ignore EIO of stable_secret below /proc/sys/net/ipv6/conf
Applying: hwclock: make glibc 2.31 compatible
Using index info to reconstruct a base tree...
M	util-linux/hwclock.c
Falling back to patching base and 3-way merge...
Auto-merging util-linux/hwclock.c
CONFLICT (content): Merge conflict in util-linux/hwclock.c
error: Failed to merge in the changes.
Patch failed at 0011 hwclock: make glibc 2.31 compatible
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/busybox
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/busybox/busybox_1.33.0.bb




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============0145801686874782157==--
