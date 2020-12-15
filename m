Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.919.1608060223380956986
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:23:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id E4B4B38C144E
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 19:23:46 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libjitterentropy: upgrading to 3.0.0 FAILED
Message-ID: <MADEUP.1650FA4229EE0F1C.26086@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============6016165040022953198=="

--===============6016165040022953198==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libjitterentropy* to *3.0.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libjitterentropy failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1509 entries from dependency cache.
INFO: Extracting current version source...
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
Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting upgraded version source...
WARNING: Command 'git rebase a37e57d9b939d1f93a1b92e1486edd44a3c1cb4c' failed:
First, rewinding head to replay your work on top of it...
Applying: Make man pages reproducible
Using index info to reconstruct a base tree...
M	Makefile
Falling back to patching base and 3-way merge...
Auto-merging Makefile
CONFLICT (content): Merge conflict in Makefile
error: Failed to merge in the changes.
Patch failed at 0001 Make man pages reproducible
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Using source tree as build directory since that would be the default for this recipe
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/libjitterentropy
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/libjitterentropy/libjitterentropy_3.0.0.bb
INFO: License checksums have been updated in the new recipe; please refer to it for the difference between the old and the new license texts.



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============6016165040022953198==--
