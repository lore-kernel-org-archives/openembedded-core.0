Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.39494.1605551303744375982
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 10:28:24 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-2.yocto.io (unknown [172.29.10.56])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5532438C13B4
	for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 18:28:23 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gdk-pixbuf: upgrading to 2.42.0 FAILED
Message-ID: <MADEUP.164810679A30E9CD.17549@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============3042225045775707504=="

--===============3042225045775707504==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gdk-pixbuf* to *2.42.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe gdk-pixbuf failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1417 entries from dependency cache.
INFO: Extracting current version source...
INFO: SRC_URI contains some conditional appends/prepends - will create branches to represent these
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0f000146aa1dd5bfc953e707921c5369d44f7456"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://ftp.gnome.org/pub/GNOME/sources/gdk-pixbuf/2.42/gdk-pixbuf-2.42.0.tar.xz...
Loading cache...done.
Loaded 1417 entries from dependency cache.
Parsing recipes...done.
Parsing of 792 .bb files complete (790 cached, 2 parsed). 1373 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-20201116"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:0f000146aa1dd5bfc953e707921c5369d44f7456"
workspace            = "master:aaf6aa3e530deb4a8d818a55a37b9029980b0b0d"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
WARNING: Command 'git rebase 40bd86cd2b28640cb486b4d4d5ea7f3f011094d9' failed:
First, rewinding head to replay your work on top of it...
Applying: gdk-pixbuf: add an option so that loader errors are fatal
Applying: Work-around thumbnailer cross-compile failure
Applying: Generate loaders.cache using a native tool when cross-compiling
Applying: Do not run tests when building
Using index info to reconstruct a base tree...
M	tests/meson.build
Falling back to patching base and 3-way merge...
Auto-merging tests/meson.build
CONFLICT (content): Merge conflict in tests/meson.build
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch' to see the failed patch
Patch failed at 0004 Do not run tests when building

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/gdk-pixbuf
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/gdk-pixbuf/gdk-pixbuf_2.42.0.bb




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============3042225045775707504==--
