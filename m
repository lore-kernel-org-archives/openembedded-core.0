Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web10.1362.1618510600061197652
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id C3CC638C11E1
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdk-pixbuf: upgrading to 2.42.6 FAILED
Message-ID: <MADEUP.16761AD126853567.4047@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============6929927949559666608=="

--===============6929927949559666608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gdk-pixbuf* to *2.42.6* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gdk-pixbuf failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1438 entries from dependency cache.
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
Removing 1 recipes from the x86_64 sysroot...done.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f3ce65cf9b23f88e3aab56ad2cc6480c848ff8ab"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 11 seconds
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnome.org/pub/GNOME/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.6.tar.xz...
Loading cache...done.
Loaded 1438 entries from dependency cache.
Parsing recipes...done.
Parsing of 815 .bb files complete (813 cached, 2 parsed). 1439 targets, 31 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:f3ce65cf9b23f88e3aab56ad2cc6480c848ff8ab"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  20% |#######                             | ETA:  0:00:00
Adding changed files:  41% |##############                      | ETA:  0:00:00
Adding changed files:  61% |######################              | ETA:  0:00:00
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
WARNING: Command 'git rebase a44c633da98d6f948c77b6ffa62e73b5be80df01' failed:
Rebasing (1/8)
Rebasing (2/8)
Rebasing (3/8)
Rebasing (4/8)
error: could not apply 7baf9a4... Do not run tests when building
Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".
Could not apply 7baf9a4... Do not run tests when building
Auto-merging tests/meson.build
CONFLICT (content): Merge conflict in tests/meson.build

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/gdk-pixbuf
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/gdk-pixbuf/gdk-pixbuf_2.42.6.bb




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============6929927949559666608==--
