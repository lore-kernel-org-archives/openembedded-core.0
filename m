Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.47.1594831379733027522
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2020 09:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8421EE01EAD; Wed, 15 Jul 2020 09:42:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.2 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.111] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7026FE01E91
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2020 09:42:57 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] kbd: upgrading to 2.3.0 FAILED
Message-Id: <20200715164259.8421EE01EAD@yocto-www.yoctoproject.org>
Date: Wed, 15 Jul 2020 09:42:59 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============8405118575777951328=="

--===============8405118575777951328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *kbd* to *2.3.0* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe kbd failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1339 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20200715"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a03a3175610203616050f8372c50931df03f851f"
workspace            = "master:ca701cb92dcf186664d9b1f82c679e4f9cc388ec"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 22 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 102 tasks of which 99 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds
INFO: Adding local source files to srctree...
INFO: Extracting upgraded version source...
INFO: Fetching https://cdn.kernel.org/pub/linux/utils/kbd/kbd-2.3.0.tar.xz...
Loading cache...done.
Loaded 1339 entries from dependency cache.
Parsing recipes...done.
Parsing of 779 .bb files complete (777 cached, 2 parsed). 1340 targets, 33 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20200715"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a03a3175610203616050f8372c50931df03f851f"
workspace            = "master:ca701cb92dcf186664d9b1f82c679e4f9cc388ec"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 18 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 83 tasks of which 81 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  22% |########                            | ETA:  0:00:00
Adding changed files:  44% |################                    | ETA:  0:00:00
Adding changed files:  66% |########################            | ETA:  0:00:00
Adding changed files:  89% |################################    | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
WARNING: Command 'git rebase cc503ee0c4fd1986916a1e584de7d8a05b541a09' failed:
First, rewinding head to replay your work on top of it...
Applying: kbd: create ptest sub-package
Using index info to reconstruct a base tree...
M	tests/Makefile.am
A	tests/alt-is-meta.in
A	tests/dumpkeys-bkeymap.in
A	tests/dumpkeys-fulltable.in
A	tests/dumpkeys-mktable.in
Falling back to patching base and 3-way merge...
CONFLICT (modify/delete): tests/dumpkeys-mktable.in deleted in HEAD and modified in kbd: create ptest sub-package. Version kbd: create ptest sub-package of tests/dumpkeys-mktable.in left in tree.
CONFLICT (modify/delete): tests/dumpkeys-fulltable.in deleted in HEAD and modified in kbd: create ptest sub-package. Version kbd: create ptest sub-package of tests/dumpkeys-fulltable.in left in tree.
CONFLICT (modify/delete): tests/dumpkeys-bkeymap.in deleted in HEAD and modified in kbd: create ptest sub-package. Version kbd: create ptest sub-package of tests/dumpkeys-bkeymap.in left in tree.
CONFLICT (modify/delete): tests/alt-is-meta.in deleted in HEAD and modified in kbd: create ptest sub-package. Version kbd: create ptest sub-package of tests/alt-is-meta.in left in tree.
Auto-merging tests/Makefile.am
CONFLICT (content): Merge conflict in tests/Makefile.am
error: Failed to merge in the changes.
Patch failed at 0001 kbd: create ptest sub-package
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/kbd
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/kbd/kbd_2.3.0.bb




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============8405118575777951328==--
