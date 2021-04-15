Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.1348.1618510600151102655
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 0EAA138C13BE
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:41 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] puzzles: upgrading to f8b15bab6b2a8dd8309cdef3dc49ae3377cb997d FAILED
Message-ID: <MADEUP.16761AD1772D1A01.12681@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============1251756578318594300=="

--===============1251756578318594300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *puzzles* to *f8b15bab6b2a8dd8309cdef3dc49ae3377cb997d* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe puzzles failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1438 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:13085038b6bb2e86eb6875695675c37a887cc403"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 4 seconds
INFO: Extracting upgraded version source...
WARNING: Command 'git rebase f8b15bab6b2a8dd8309cdef3dc49ae3377cb997d' failed:
Rebasing (1/7)
Rebasing (2/7)
Rebasing (3/7)
error: could not apply fee48c3... Use -Wno-error=format-overflow= if the compiler supports it
Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".
Could not apply fee48c3... Use -Wno-error=format-overflow= if the compiler supports it
CONFLICT (modify/delete): configure.ac deleted in HEAD and modified in fee48c3... Use -Wno-error=format-overflow= if the compiler supports it. Version fee48c3... Use -Wno-error=format-overflow= if the compiler supports it of configure.ac left in tree.

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/puzzles
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/puzzles/puzzles_git.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============1251756578318594300==--
