Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.5110.1613463848635394653
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5725F38C128F
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:08 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] e2fsprogs: upgrading to 1.46.1 FAILED
Message-ID: <MADEUP.16642CD26B70014D.5617@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============9038004588962442393=="

--===============9038004588962442393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *e2fsprogs* to *1.46.1* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe e2fsprogs failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1428 entries from dependency cache.
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-ec5fe82cc2f0991530ba1bb0c9203674cfe95f44"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ec5fe82cc2f0991530ba1bb0c9203674cfe95f44"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
WARNING: Command 'git rebase df0fe7c9a34a9ad5184cb65e31e05a0b4744b954' failed:
First, rewinding head to replay your work on top of it...
Applying: When /etc/ld.so.cache is writeable by user running bitbake then it creates invalid cache (in my case libstdc++.so cannot be found after building zlib(-native) and I have to call touch */libstdc++.so && /sbin/ldconfig to fix it.
Applying: e2fsprogs: add ptest
Applying: e2fsprogs: expand @mkdir_p@
Using index info to reconstruct a base tree...
M	configure.ac
Falling back to patching base and 3-way merge...
Auto-merging configure.ac
CONFLICT (content): Merge conflict in configure.ac
error: Failed to merge in the changes.
Patch failed at 0003 e2fsprogs: expand @mkdir_p@
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/e2fsprogs
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/e2fsprogs/e2fsprogs_1.46.1.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============9038004588962442393==--
