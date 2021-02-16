Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.5219.1613463848596552830
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id DB27738C128A
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:08 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] librepo: upgrading to 1.13.0 FAILED
Message-ID: <MADEUP.16642CD27F2DFB1A.16989@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============0461942808214682013=="

--===============0461942808214682013==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *librepo* to *1.13.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe librepo failed.
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
DISTRO_VERSION       = "3.2+snapshot-5d31bab27cdeac748c1e21d60319df4524b9810c"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:5d31bab27cdeac748c1e21d60319df4524b9810c"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting upgraded version source...
WARNING: Command 'git rebase a244d78bab11510408fb9413f1c78c2f56c69fa5' failed:
First, rewinding head to replay your work on top of it...
Applying: Do not try to obtain PYTHON_INSTALL_DIR by running python.
Using index info to reconstruct a base tree...
A	librepo/python/python2/CMakeLists.txt
A	librepo/python/python3/CMakeLists.txt
Falling back to patching base and 3-way merge...
CONFLICT (modify/delete): librepo/python/python2/CMakeLists.txt deleted in HEAD and modified in Do not try to obtain PYTHON_INSTALL_DIR by running python.. Version Do not try to obtain PYTHON_INSTALL_DIR by running python. of librepo/python/python2/CMakeLists.txt left in tree.
Auto-merging librepo/python/CMakeLists.txt
CONFLICT (content): Merge conflict in librepo/python/CMakeLists.txt
error: Failed to merge in the changes.
Patch failed at 0001 Do not try to obtain PYTHON_INSTALL_DIR by running python.
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/librepo
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/librepo/librepo_1.13.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============0461942808214682013==--
