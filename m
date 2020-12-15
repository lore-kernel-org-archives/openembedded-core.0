Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.919.1608060223380956986
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Dec 2020 11:23:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.111] (unknown [172.29.10.111])
	by mail.yoctoproject.org (Postfix) with ESMTP id 2953138C13E9
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Dec 2020 19:23:44 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Tim Orling <timothy.t.orling@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-pytest: upgrading to 6.2.0 FAILED
Message-ID: <MADEUP.1650FA41121D2F27.26086@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============2171560756522183839=="

--===============2171560756522183839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-pytest* to *6.2.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe python3-pytest failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1445 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-4f1bd5f315f3274bbc454a787fc2413eaa1601b4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4f1bd5f315f3274bbc454a787fc2413eaa1601b4"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/p/pytest/pytest-6.2.0.tar.gz...
Loading cache...done.
Loaded 1445 entries from dependency cache.
Parsing recipes...done.
Parsing of 808 .bb files complete (806 cached, 2 parsed). 1414 targets, 31 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-4f1bd5f315f3274bbc454a787fc2413eaa1601b4"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4f1bd5f315f3274bbc454a787fc2413eaa1601b4"
workspace            = "master:796be0593a607938aef3941372a9238b7e895446"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  60% |#####################               | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
WARNING: Command 'git rebase 73e84ae2d03bf15319ccbdc728529452636950c7' failed:
First, rewinding head to replay your work on top of it...
Applying: setup.py: remove the setup_requires for setuptools-scm
Using index info to reconstruct a base tree...
M	setup.cfg
Falling back to patching base and 3-way merge...
Auto-merging setup.cfg
CONFLICT (content): Merge conflict in setup.cfg
error: Failed to merge in the changes.
Patch failed at 0001 setup.py: remove the setup_requires for setuptools-scm
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/python3-pytest
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/python3-pytest/python3-pytest_6.2.0.bb




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============2171560756522183839==--
