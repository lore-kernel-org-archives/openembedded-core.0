Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.12520.1602843683017164064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id F10C438C17B9
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:22 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] ltp: upgrading to 20200930 FAILED
Message-ID: <MADEUP.163E71D6D4493A36.19966@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============3037018033319442764=="

--===============3037018033319442764==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *ltp* to *20200930* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe ltp failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1477 entries from dependency cache.
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
meta-yocto-bsp       = "tmp-auh-upgrades:a0ebef74a943270cbe07c4a6b1da161e2a771f8b"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting upgraded version source...
WARNING: Command 'git rebase da2f34028f046a208aa2fed5e287df2538e69f91' failed:
First, rewinding head to replay your work on top of it...
Applying: build: Add option to select libc implementation
Applying: Fix test_proc_kill hanging
Applying: Add more musl exclusions
Applying: sigwaitinfo: Do not run invalid/undefined test cases
.git/rebase-apply/patch:18: trailing whitespace.
	test_masked_matching_noinfo, my_rt_sigtimedwait, SIGUSR1}, 
warning: 1 line adds whitespace errors.
Using index info to reconstruct a base tree...
M	testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
Falling back to patching base and 3-way merge...
Auto-merging testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
CONFLICT (content): Merge conflict in testcases/kernel/syscalls/sigwaitinfo/sigwaitinfo01.c
error: Failed to merge in the changes.
Patch failed at 0004 sigwaitinfo: Do not run invalid/undefined test cases
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since recipe inherits autotools-brokensep
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/ltp
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/ltp/ltp_20200930.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============3037018033319442764==--
