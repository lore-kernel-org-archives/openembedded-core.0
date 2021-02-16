Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.5170.1613463848543488864
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 271DD38C1283
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:12 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libhandy: upgrading to 1.1.90 FAILED
Message-ID: <MADEUP.16642CD33FD569F9.7752@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============3326785352027571982=="

--===============3326785352027571982==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libhandy* to *1.1.90* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe libhandy failed.
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
DISTRO_VERSION       = "3.2+snapshot-35283dbeb1cb5d9ba7762e4e0831fbe62279052b"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:35283dbeb1cb5d9ba7762e4e0831fbe62279052b"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting upgraded version source...
WARNING: Command 'git rebase 89a1610b62533c9d6c5267cfac0108e724df25ba' failed:
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
error: Failed to merge in the changes.
Patch failed at 0001 Release 1.0.3
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/libhandy
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/libhandy/libhandy_1.1.90.bb



Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============3326785352027571982==--
