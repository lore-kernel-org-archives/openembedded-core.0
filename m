Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.5171.1613463848621642100
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:15 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0686B38C12A7
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:15 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] pinentry: upgrading to 1.1.1 FAILED
Message-ID: <MADEUP.16642CD3F2F4585F.16989@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============4620247746311324957=="

--===============4620247746311324957==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *pinentry* to *1.1.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe pinentry failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1428 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-50df9ec6594c99c3402e855b544e4ad879a54bdf"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:50df9ec6594c99c3402e855b544e4ad879a54bdf"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting upgraded version source...
INFO: Fetching https://www.gnupg.org/ftp/gcrypt/pinentry/pinentry-1.1.1.tar.bz2...
Loading cache...done.
Loaded 1428 entries from dependency cache.
Parsing recipes...done.
Parsing of 811 .bb files complete (809 cached, 2 parsed). 1429 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-50df9ec6594c99c3402e855b544e4ad879a54bdf"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:50df9ec6594c99c3402e855b544e4ad879a54bdf"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
WARNING: Command 'git rebase 80afd674f8fd3521a0011577fdbf4ada274ecb3d' failed:
First, rewinding head to replay your work on top of it...
Applying: libassuan: Improve pkgconfig support
Using index info to reconstruct a base tree...
M	configure.ac
M	m4/libassuan.m4
Falling back to patching base and 3-way merge...
Auto-merging m4/libassuan.m4
CONFLICT (content): Merge conflict in m4/libassuan.m4
Auto-merging configure.ac
error: Failed to merge in the changes.
Patch failed at 0001 libassuan: Improve pkgconfig support
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/pinentry
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/pinentry/pinentry_1.1.1.bb




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============4620247746311324957==--
