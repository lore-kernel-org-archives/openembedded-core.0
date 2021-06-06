Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.25785.1623000257291957656
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id A7DB638C11C7
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:16 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] util-linux-libuuid: upgrading to 2.37 FAILED
Message-ID: <MADEUP.16860E22952B5191.29797@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============2578169994927549645=="

--===============2578169994927549645==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *util-linux-libuuid* to *2.37* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe util-linux-libuuid failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1452 entries from dependency cache.
INFO: Extracting current version source...
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-ae7595a603f3fea1750f3f170e0e7c8098a352c7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ae7595a603f3fea1750f3f170e0e7c8098a352c7"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/linux/utils/util-linux/v2.37/util-linux-2.37.tar.xz...
Loading cache...done.
Loaded 1452 entries from dependency cache.
Parsing recipes...done.
Parsing of 817 .bb files complete (815 cached, 2 parsed). 1453 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-ae7595a603f3fea1750f3f170e0e7c8098a352c7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ae7595a603f3fea1750f3f170e0e7c8098a352c7"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  12% |####                                | ETA:  0:00:00
Adding changed files:  25% |#########                           | ETA:  0:00:00
Adding changed files:  38% |#############                       | ETA:  0:00:00
Adding changed files:  51% |##################                  | ETA:  0:00:00
Adding changed files:  64% |#######################             | ETA:  0:00:00
Adding changed files:  77% |###########################         | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
WARNING: Command 'git rebase 51bcb4d5be7ede3a9675db632869db3f0192f0fc' failed:
First, rewinding head to replay your work on top of it...
Applying: util-linux: Ensure that ${sbindir} is respected
Applying: Define TESTS variable
Using index info to reconstruct a base tree...
M	Makefile.am
Falling back to patching base and 3-way merge...
Auto-merging Makefile.am
Applying: Display testname for subtest
Applying: util-linux: Add ptest
Using index info to reconstruct a base tree...
M	configure.ac
Falling back to patching base and 3-way merge...
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac
error: Failed to merge in the changes.
Patch failed at 0004 util-linux: Add ptest
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/util-linux-libuuid
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/util-linux-libuuid/util-linux-libuuid_2.37.bb




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============2578169994927549645==--
