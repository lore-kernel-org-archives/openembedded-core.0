Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.5170.1613463848543488864
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:14 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id D1E9D38C1290
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:13 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] webkitgtk: upgrading to 2.30.5 FAILED
Message-ID: <MADEUP.16642CD3A7E897A8.5617@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============6353628013536935196=="

--===============6353628013536935196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *webkitgtk* to *2.30.5* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe webkitgtk failed.
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
DISTRO_VERSION       = "3.2+snapshot-2e690b9e9bddaf75bfdc459d5d812683dac7f359"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2e690b9e9bddaf75bfdc459d5d812683dac7f359"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting upgraded version source...
INFO: Fetching https://www.webkitgtk.org/releases/webkitgtk-2.30.5.tar.xz...
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
DISTRO_VERSION       = "3.2+snapshot-2e690b9e9bddaf75bfdc459d5d812683dac7f359"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:2e690b9e9bddaf75bfdc459d5d812683dac7f359"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
WARNING: Command 'git rebase 4bb256c1db3aa71a9167cfdcac8ce83db7e317ad' failed:
First, rewinding head to replay your work on top of it...
Applying: FindGObjectIntrospection.cmake: prefix variables obtained from pkg-config with PKG_CONFIG_SYSROOT_DIR
Applying: When building introspection files, add CMAKE_C_FLAGS to the compiler flags.
Applying: Fix racy parallel build of WebKit2-4.0.gir
Using index info to reconstruct a base tree...
M	Source/WebKit/PlatformGTK.cmake
Falling back to patching base and 3-way merge...
Auto-merging Source/WebKit/PlatformGTK.cmake
CONFLICT (content): Merge conflict in Source/WebKit/PlatformGTK.cmake
error: Failed to merge in the changes.
Patch failed at 0003 Fix racy parallel build of WebKit2-4.0.gir
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/webkitgtk
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/webkitgtk/webkitgtk_2.30.5.bb




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============6353628013536935196==--
