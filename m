Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web09.939.1608060224019939385
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:23:50 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id DE3B938C16DA
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 19:23:46 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libcap: upgrading to 2.46 FAILED
Message-ID: <MADEUP.1650FA427DA22F3F.29031@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============6026154982753842468=="

--===============6026154982753842468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libcap* to *2.46* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libcap failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1509 entries from dependency cache.
INFO: Extracting current version source...
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-27f7ede005a11f5630d698c32198ee21da5c4e7d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:27f7ede005a11f5630d698c32198ee21da5c4e7d"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.46.tar.xz...
Loading cache...done.
Loaded 1509 entries from dependency cache.
Parsing recipes...done.
Parsing of 808 .bb files complete (806 cached, 2 parsed). 1414 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-27f7ede005a11f5630d698c32198ee21da5c4e7d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:27f7ede005a11f5630d698c32198ee21da5c4e7d"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

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
WARNING: Command 'git rebase 53f8893d2a36a51bd1d3954035daebb10fb1a4f0' failed:
First, rewinding head to replay your work on top of it...
Applying: Ensure the XATTR_NAME_CAPS is defined when it is used
Applying: tests: do not run target executables
Applying: tests: do not statically link a test
Using index info to reconstruct a base tree...
M	tests/Makefile
Falling back to patching base and 3-way merge...
Auto-merging tests/Makefile
CONFLICT (content): Merge conflict in tests/Makefile
error: Failed to merge in the changes.
Patch failed at 0003 tests: do not statically link a test
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/libcap
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/libcap/libcap_2.46.bb




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============6026154982753842468==--
