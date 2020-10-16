Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.12422.1602843683509209864
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7E24B38C174E
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:24 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules: upgrading to 2.12.3 FAILED
Message-ID: <MADEUP.163E71D71E59317C.21580@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============0315084118211619486=="

--===============0315084118211619486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-modules* to *2.12.3* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe lttng-modules failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1511 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0b6072557ca45ebd91ea16a5d5661a648606e404"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting upgraded version source...
INFO: Fetching https://lttng.org/files/lttng-modules/lttng-modules-2.12.3.tar.bz2...
Loading cache...done.
Loaded 1511 entries from dependency cache.
Parsing recipes...done.
Parsing of 786 .bb files complete (784 cached, 2 parsed). 1357 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0b6072557ca45ebd91ea16a5d5661a648606e404"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

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
WARNING: Command 'git rebase f5cf149a09a8dad61287714e0f61a3a4cce33da4' failed:
First, rewinding head to replay your work on top of it...
Applying: Makefile: Do not fail if CONFIG_TRACEPOINTS is not enabled
Applying: BUILD_RUNTIME_BUG_ON vs gcc7
Applying: Kconfig: fix dependency issue when building in-tree without CONFIG_FTRACE
Using index info to reconstruct a base tree...
M	Kconfig
Falling back to patching base and 3-way merge...
No changes -- Patch already applied.
Applying: fix: Move mmutrace.h into the mmu/ sub-directory (v5.9)
Using index info to reconstruct a base tree...
M	probes/lttng-probe-kvm-x86-mmu.c
Falling back to patching base and 3-way merge...
Auto-merging probes/lttng-probe-kvm-x86-mmu.c
CONFLICT (content): Merge conflict in probes/lttng-probe-kvm-x86-mmu.c
error: Failed to merge in the changes.
Patch failed at 0004 fix: Move mmutrace.h into the mmu/ sub-directory (v5.9)
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.

--2020-10-16 09:22:19--  http://downloads.yoctoproject.org/mirror/sources/git2_git.lttng.org.lttng-modules.tar.gz
Resolving downloads.yoctoproject.org (downloads.yoctoproject.org)... 172.29.10.13
Connecting to downloads.yoctoproject.org (downloads.yoctoproject.org)|172.29.10.13|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2020-10-16 09:22:19 ERROR 404: Not Found.

Cloning into bare repository '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/git2/git.lttng.org.lttng-modules'...
remote: Enumerating objects: 15780, done.        
remote: Counting objects: 100% (15780/15780), done.        
remote: Compressing objects: 100% (6024/6024), done.        
remote: Total 15780 (delta 11708), reused 13411 (delta 9595)        
Receiving objects: 100% (15780/15780), 2.95 MiB | 5.68 MiB/s, done.
Resolving deltas: 100% (11708/11708), done.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/lttng-modules
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/lttng-modules/lttng-modules_2.12.3.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============0315084118211619486==--
