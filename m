Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.7615.1625391858178007222
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jul 2021 02:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from debian10-ty-1.yocto.io (unknown [172.29.10.55])
	by mail.yoctoproject.org (Postfix) with ESMTP id A522738C11C8
	for <openembedded-core@lists.openembedded.org>; Sun,  4 Jul 2021 09:44:17 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] python3-iniparse: upgrading to 0.5 FAILED
Message-ID: <MADEUP.168E8D488EF94809.2482@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============4558883518168202928=="

--===============4558883518168202928==
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
DISTRO_VERSION       = "3.3+snapshot-3091f5e67724ae60c275514aca5867c6b0db4035"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3091f5e67724ae60c275514aca5867c6b0db4035"
workspace            = "master:be1cf223bf9c514ee81820ded5b13318458c0daf"

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
DISTRO_VERSION       = "3.3+snapshot-3091f5e67724ae60c275514aca5867c6b0db4035"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:3091f5e67724ae60c275514aca5867c6b0db4035"
workspace            = "master:be1cf223bf9c514ee81820ded5b13318458c0daf"

Initialising tasks...done.
Sstate summary: Wanted 0 Local 0 Network 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files: 100% |####################################| Time: 0:00:00
INFO: Rebasing devtool onto 149645c90210881d9129256fd39391bccd5b4128
WARNING: Command 'git rebase 149645c90210881d9129256fd39391bccd5b4128' failed:
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
Auto-merging tests/test_tidy.py
Auto-merging tests/test_misc.py
Auto-merging tests/test_ini.py
Auto-merging tests/test_fuzz.py
CONFLICT (content): Merge conflict in tests/test_fuzz.py
Auto-merging tests/test_compat.py
CONFLICT (content): Merge conflict in tests/test_compat.py
Auto-merging tests/__init__.py
Auto-merging iniparse/utils.py
CONFLICT (content): Merge conflict in iniparse/utils.py
Auto-merging iniparse/ini.py
CONFLICT (content): Merge conflict in iniparse/ini.py
Auto-merging iniparse/config.py
Auto-merging iniparse/compat.py
CONFLICT (content): Merge conflict in iniparse/compat.py
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch' to see the failed patch
Patch failed at 0001 Add python 3 compatibility.

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

--===============4558883518168202928==--
