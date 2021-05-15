Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.4567.1621074783434697778
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 769C038C13C0
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:03 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] rpcbind: upgrading to 1.2.6 FAILED
Message-ID: <MADEUP.167F36ED801C38BA.8202@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============3815518488062476208=="

--===============3815518488062476208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *rpcbind* to *1.2.6* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe rpcbind failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1459 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-78bc87074b90b02069af6c51bbd501b3714f499d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:78bc87074b90b02069af6c51bbd501b3714f499d"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://downloads.sourceforge.net/rpcbind/rpcbind-1.2.6.tar.bz2...
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
DISTRO_VERSION       = "3.3+snapshot-78bc87074b90b02069af6c51bbd501b3714f499d"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:78bc87074b90b02069af6c51bbd501b3714f499d"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
WARNING: Command 'git rebase efb1be1db0331477ba26caf63404ae01a20f3cb1' failed:
Rebasing (1/2)
error: could not apply 4c0dfc9... add option to make users able to use fixed port number
Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".
Could not apply 4c0dfc9... add option to make users able to use fixed port number
Auto-merging src/rpcbind.c
Auto-merging src/rpcb_svc_com.c
Auto-merging man/rpcbind.8
CONFLICT (content): Merge conflict in man/rpcbind.8

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/rpcbind
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/rpcbind/rpcbind_1.2.6.bb




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============3815518488062476208==--
