Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.16614.1598724144871854754
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Aug 2020 11:02:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 140.211.169.56, mailfrom: auh@auh.yoctoproject.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B4DE9E020D3; Sat, 29 Aug 2020 11:02:24 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_00,HELO_MISC_IP,
	MISSING_DATE,MISSING_MID,RDNS_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.5 MISSING_MID Missing Message-Id: header
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
	*  1.4 MISSING_DATE Missing Date: header
	*  0.0 HELO_MISC_IP Looking for more Dynamic IP Relays
Received: from [172.29.10.113] (unknown [198.145.29.2])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 733EFE020E6
	for <openembedded-core@lists.openembedded.org>; Sat, 29 Aug 2020 11:01:57 -0700 (PDT)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] nasm: upgrading to 2.15.05 FAILED
Message-Id: <20200829180224.B4DE9E020D3@yocto-www.yoctoproject.org>
Date: Sat, 29 Aug 2020 11:02:24 -0700 (PDT)
Content-Type: multipart/mixed; boundary="===============3651710573962245409=="

--===============3651710573962245409==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *nasm* to *2.15.05* has Failed (devtool error).

Detailed error information:

Running 'devtool upgrade' for recipe nasm failed.
NOTE: Starting bitbake server...
NOTE: Reconnecting to bitbake server...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1341 entries from dependency cache.
INFO: Extracting current version source...
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20200829"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:418dd0a4bbe3ad7b865648a8064e0818892272ad"
workspace            = "master:104ff3c834d9ea60de4600fca374c0bdc9ca843d"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 20 (0% match, 100% complete)
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 93 tasks of which 90 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds
INFO: Extracting upgraded version source...
INFO: Fetching http://www.nasm.us/pub/nasm/releasebuilds/2.15.05/nasm-2.15.05.tar.bz2...
Loading cache...done.
Loaded 1341 entries from dependency cache.
Parsing recipes...done.
Parsing of 780 .bb files complete (778 cached, 2 parsed). 1342 targets, 35 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.1+snapshot-20200829"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:418dd0a4bbe3ad7b865648a8064e0818892272ad"
workspace            = "master:104ff3c834d9ea60de4600fca374c0bdc9ca843d"

Initialising tasks...done.
Sstate summary: Wanted 0 Found 0 Missed 0 Current 0 (0% match, 0% complete)
NOTE: No setscene tasks
NOTE: Executing Tasks
NOTE: Tasks Summary: Attempted 2 tasks of which 0 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 0 seconds
DEBUG 5 [Errno 25] Inappropriate ioctl for device
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:   0% |                                   | ETA:  --:--:--
Adding changed files:  65% |#######################             | ETA:  0:00:00
Adding changed files: 100% |####################################| Time: 0:00:00
WARNING: Command 'git rebase a8c73a99ac03e5d5f96d4a3ddbf6aa0656a71a55' failed:
First, rewinding head to replay your work on top of it...
Applying: stdlib: Add strlcat
Applying: Add --debug-prefix-map option
.git/rebase-apply/patch:239: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
Using index info to reconstruct a base tree...
M	asm/nasm.c
M	include/nasmlib.h
M	output/outcoff.c
M	output/outieee.c
M	output/outobj.c
Falling back to patching base and 3-way merge...
Auto-merging output/outobj.c
Auto-merging output/outieee.c
Auto-merging output/outcoff.c
Auto-merging include/nasmlib.h
Auto-merging asm/nasm.c
CONFLICT (content): Merge conflict in asm/nasm.c
error: Failed to merge in the changes.
Patch failed at 0002 Add --debug-prefix-map option
Use 'git am --show-current-patch' to see the failed patch

Resolve all conflicts manually, mark them as resolved with
"git add/rm <conflicted_files>", then run "git rebase --continue".
You can instead skip this commit: run "git rebase --skip".
To abort and get back to the state before "git rebase", run "git rebase --abort".

You will need to resolve conflicts in order to complete the upgrade.
INFO: Upgraded source extracted to /home/pokybuild/yocto-worker/auh/build/build/build/workspace/sources/nasm
INFO: New recipe is /home/pokybuild/yocto-worker/auh/build/build/build/workspace/recipes/nasm/nasm_2.15.05.bb




Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============3651710573962245409==--
