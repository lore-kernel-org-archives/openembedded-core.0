Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.328.1615826521152834421
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Mar 2021 09:42:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 68A8838C1362
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Mar 2021 16:42:01 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libhandy: upgrading to 1.2.0 FAILED
Message-ID: <MADEUP.166C91A921D6858B.27320@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============1418834821006198554=="

--===============1418834821006198554==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libhandy* to *1.2.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libhandy failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1438 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-c593a17477c3c4a50600195b3c6fd8098add2ce7"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c593a17477c3c4a50600195b3c6fd8098add2ce7"
workspace            = "master:eec64066073428e38d5b0b6947ff302943188f65"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting upgraded version source...
WARNING: Command 'git rebase 7b38a860ffcec6c2ad28153358cc3d037ddb618f' failed:
First, rewinding head to replay your work on top of it...
Applying: Release 1.0.3
Using index info to reconstruct a base tree...
M	NEWS
M	data/packaging/rpm/libhandy.spec
M	debian/changelog
M	meson.build
Falling back to patching base and 3-way merge...
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build
Auto-merging debian/changelog
CONFLICT (content): Merge conflict in debian/changelog
Auto-merging data/packaging/rpm/libhandy.spec
CONFLICT (content): Merge conflict in data/packaging/rpm/libhandy.spec
Auto-merging NEWS
CONFLICT (content): Merge conflict in NEWS
error: Failed to merge in the changes.
Patch failed at 0001 Release 1.0.3
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/libhandy
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/libhandy/libhandy_1.2.0.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============1418834821006198554==--
