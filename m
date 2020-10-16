Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.12220.1602843683020080320
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2020 03:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 5A0EE38C17D1
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2020 03:21:23 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] mesa: upgrading to 20.2.1 FAILED
Message-ID: <MADEUP.163E71D6FE99D03B.24086@lists.openembedded.org>
Content-Type: multipart/mixed; boundary="===============4171223296422974188=="

--===============4171223296422974188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *mesa* to *20.2.1* has Failed (devtool error).

Detailed error information:

The following devtool command failed:  upgrade mesa -V 20.2.1
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1506 entries from dependency cache.
INFO: Extracting current version source...
Removing 1 recipes from the x86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8c8821750d53fdf1f452b6ce2978cdacf7857187"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
INFO: Extracting upgraded version source...
INFO: Fetching https://mesa.freedesktop.org/archive/mesa-20.2.1.tar.xz...
Loading cache...done.
Loaded 1506 entries from dependency cache.
Parsing recipes...done.
Parsing of 786 .bb files complete (784 cached, 2 parsed). 1357 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20201016"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8c8821750d53fdf1f452b6ce2978cdacf7857187"
workspace            = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   2% |#                                   | ETA:  0:00:03
Adding changed files:   5% |##                                  | ETA:  0:00:02
Adding changed files:   8% |###                                 | ETA:  0:00:02
Adding changed files:  11% |####                                | ETA:  0:00:02
Adding changed files:  14% |#####                               | ETA:  0:00:02
Adding changed files:  17% |######                              | ETA:  0:00:01
Adding changed files:  20% |#######                             | ETA:  0:00:01
Adding changed files:  22% |########                            | ETA:  0:00:01
Adding changed files:  25% |#########                           | ETA:  0:00:01
Adding changed files:  28% |##########                          | ETA:  0:00:01
Adding changed files:  31% |###########                         | ETA:  0:00:01
Adding changed files:  34% |############                        | ETA:  0:00:01
Adding changed files:  37% |#############                       | ETA:  0:00:00
Adding changed files:  40% |##############                      | ETA:  0:00:01
Adding changed files:  42% |###############                     | ETA:  0:00:01
Adding changed files:  45% |################                    | ETA:  0:00:00
Adding changed files:  48% |#################                   | ETA:  0:00:00
Adding changed files:  51% |##################                  | ETA:  0:00:00
Adding changed files:  54% |###################                 | ETA:  0:00:00
Adding changed files:  57% |####################                | ETA:  0:00:00
Adding changed files:  60% |#####################               | ETA:  0:00:00
Adding changed files:  62% |######################              | ETA:  0:00:00
Adding changed files:  65% |#######################             | ETA:  0:00:00
Adding changed files:  68% |########################            | ETA:  0:00:00
Adding changed files:  71% |#########################           | ETA:  0:00:00
Adding changed files:  74% |##########################          | ETA:  0:00:00
Adding changed files:  77% |###########################         | ETA:  0:00:00
Adding changed files:  80% |############################        | ETA:  0:00:00
Adding changed files:  82% |#############################       | ETA:  0:00:00
Adding changed files:  85% |##############################      | ETA:  0:00:00
Adding changed files:  88% |###############################     | ETA:  0:00:00
Adding changed files:  91% |################################    | ETA:  0:00:00
Adding changed files:  94% |#################################   | ETA:  0:00:00
Adding changed files:  97% |################################### | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:01
WARNING: Command 'git rebase d8d35981c6f5f07fd7bdd65cefe1e57ff096da2b' failed:
First, rewinding head to replay your work on top of it...
Applying: meson.build: check for all linux host_os combinations
Applying: meson.build: make TLS ELF optional
Using index info to reconstruct a base tree...
M	meson.build
M	meson_options.txt
Falling back to patching base and 3-way merge...
Auto-merging meson_options.txt
Auto-merging meson.build
CONFLICT (content): Merge conflict in meson.build
error: Failed to merge in the changes.
Patch failed at 0002 meson.build: make TLS ELF optional
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
Traceback (most recent call last):
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 334, in <module>
    ret = main()
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/devtool", line 321, in main
    ret = args.func(args, config, basepath, workspace)
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/upgrade.py", line 558, in upgrade
    new_licenses = _extract_licenses(srctree, (rd.getVar('LIC_FILES_CHKSUM') or ""))
  File "/home/pokybuild/yocto-worker/auh/build/build/poky/scripts/lib/devtool/upgrade.py", line 468, in _extract_licenses
    with open(os.path.join(srcpath, path), 'rb') as f:
FileNotFoundError: [Errno 2] No such file or directory: '/home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/mesa/docs/license.html'




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============4171223296422974188==--
