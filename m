Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.703.1610713823269131175
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jan 2021 04:30:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 8179538C13E4
	for <openembedded-core@lists.openembedded.org>; Fri, 15 Jan 2021 12:30:22 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] lttng-modules: upgrading to 2.12.4 FAILED
Message-ID: <MADEUP.165A67B090120F48.6799@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============4489738415190729685=="

--===============4489738415190729685==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *lttng-modules* to *2.12.4* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe lttng-modules failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1420 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-9de31f32a8a46a6e820a49ee73d91307b0d1d394"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9de31f32a8a46a6e820a49ee73d91307b0d1d394"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
INFO: Extracting upgraded version source...
INFO: Fetching https://lttng.org/files/lttng-modules/lttng-modules-2.12.4.tar.bz2...
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
DISTRO_VERSION       = "3.2+snapshot-9de31f32a8a46a6e820a49ee73d91307b0d1d394"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9de31f32a8a46a6e820a49ee73d91307b0d1d394"
workspace            = "master:09c7fc6e5341bfadb0f6037e7294aee2454eedef"

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
WARNING: Command 'git rebase 09c6c0d51dc64314fc2f136f93dde7da93b8b2e1' failed:
Rebasing (1/9)
Rebasing (2/9)
Rebasing (3/9)
error: could not apply 498e718... fix: btrfs: tracepoints: output proper root owner for trace_find_free_extent() (v5.10)
Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".
Could not apply 498e718... fix: btrfs: tracepoints: output proper root owner for trace_find_free_extent() (v5.10)
Auto-merging instrumentation/events/lttng-module/btrfs.h
CONFLICT (content): Merge conflict in instrumentation/events/lttng-module/btrfs.h

You will need to resolve conflicts in order to complete the upgrade.

--2021-01-15 09:41:48--  http://downloads.yoctoproject.org/mirror/sources/git2_git.lttng.org.lttng-modules.tar.gz
Resolving downloads.yoctoproject.org (downloads.yoctoproject.org)... 172.29.10.13
Connecting to downloads.yoctoproject.org (downloads.yoctoproject.org)|172.29.10.13|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2021-01-15 09:41:48 ERROR 404: Not Found.

Cloning into bare repository '/home/pokybuild/yocto-worker/auh/build/build/build/downloads/git2/git.lttng.org.lttng-modules'...
remote: Enumerating objects: 16634, done.        
remote: Counting objects: 100% (16634/16634), done.        
remote: Compressing objects: 100% (6614/6614), done.        
remote: Total 16634 (delta 12381), reused 13703 (delta 9842)        
Receiving objects: 100% (16634/16634), 3.04 MiB | 6.38 MiB/s, done.
Resolving deltas: 100% (12381/12381), done.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/lttng-modules
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/lttng-modules/lttng-modules_2.12.4.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============4489738415190729685==--
