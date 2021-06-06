Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web12.25788.1623000257674308058
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jun 2021 10:24:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 6C5D438C1314
	for <openembedded-core@lists.openembedded.org>; Sun,  6 Jun 2021 17:24:18 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] p11-kit: upgrading to 0.24.0 FAILED
Message-ID: <MADEUP.16860E22FBA6E2F4.27789@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============6094485207975778255=="

--===============6094485207975778255==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *p11-kit* to *0.24.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe p11-kit failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1452 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-af2f4bbe0460f6f8dfefd04e10d906919a5e16f8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:af2f4bbe0460f6f8dfefd04e10d906919a5e16f8"
workspace            = "master:ae7595a603f3fea1750f3f170e0e7c8098a352c7"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting upgraded version source...
WARNING: Command 'git rebase 34826623f58399b24c21f1788e2cdaea34521b7b' failed:
First, rewinding head to replay your work on top of it...
Applying: anchor: Prefer persistent format when storing anchor
Using index info to reconstruct a base tree...
M	trust/anchor.c
M	trust/test-extract.sh
Falling back to patching base and 3-way merge...
Auto-merging trust/test-extract.sh
CONFLICT (content): Merge conflict in trust/test-extract.sh
error: Failed to merge in the changes.
Patch failed at 0001 anchor: Prefer persistent format when storing anchor
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/p11-kit
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/p11-kit/p11-kit_0.24.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============6094485207975778255==--
