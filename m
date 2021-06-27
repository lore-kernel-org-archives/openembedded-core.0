Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.5881.1624805202344590086
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 07:46:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [127.0.1.1] (unknown [172.29.10.115])
	by mail.yoctoproject.org (Postfix) with ESMTP id B55CE38C08B0
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 14:46:41 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-iniparse: upgrading to 0.5 FAILED
Message-ID: <MADEUP.168C77B91A348908.8895@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============8763128038880107888=="

--===============8763128038880107888==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *python3-iniparse* to *0.5* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe python3-iniparse failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1455 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-4efe68806168f2470dd68142481c8ec0cff0685f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4efe68806168f2470dd68142481c8ec0cff0685f"
workspace            = "master:3ea3e3435fc7d94e6eb04cf9cd9f66ee946f6af6"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
INFO: Extracting upgraded version source...
INFO: Fetching https://files.pythonhosted.org/packages/source/i/iniparse/iniparse-0.5.tar.gz...
Loading cache...done.
Loaded 1455 entries from dependency cache.
Parsing recipes...done.
Parsing of 819 .bb files complete (817 cached, 2 parsed). 1456 targets, 32 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-4efe68806168f2470dd68142481c8ec0cff0685f"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4efe68806168f2470dd68142481c8ec0cff0685f"
workspace            = "master:3ea3e3435fc7d94e6eb04cf9cd9f66ee946f6af6"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Rebasing devtool onto f5591767d843a8aa5d6e2adf8b93c08161473b6f
WARNING: Command 'git rebase f5591767d843a8aa5d6e2adf8b93c08161473b6f' failed:
First, rewinding head to replay your work on top of it...
Applying: Add python 3 compatibility.
Using index info to reconstruct a base tree...
M	iniparse/__init__.py
M	iniparse/compat.py
M	iniparse/config.py
M	iniparse/ini.py
M	iniparse/utils.py
M	tests/__init__.py
M	tests/test_compat.py
M	tests/test_fuzz.py
M	tests/test_ini.py
M	tests/test_misc.py
M	tests/test_tidy.py
M	tests/test_unicode.py
Falling back to patching base and 3-way merge...
Auto-merging tests/test_unicode.py
CONFLICT (content): Merge conflict in tests/test_unicode.py
Auto-merging tests/test_fuzz.py
CONFLICT (content): Merge conflict in tests/test_fuzz.py
Auto-merging tests/test_compat.py
CONFLICT (content): Merge conflict in tests/test_compat.py
Auto-merging iniparse/utils.py
CONFLICT (content): Merge conflict in iniparse/utils.py
Auto-merging iniparse/ini.py
CONFLICT (content): Merge conflict in iniparse/ini.py
Auto-merging iniparse/compat.py
CONFLICT (content): Merge conflict in iniparse/compat.py
error: Failed to merge in the changes.
Patch failed at 0001 Add python 3 compatibility.
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/python3-iniparse
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/python3-iniparse/python3-iniparse_0.5.bb




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============8763128038880107888==--
